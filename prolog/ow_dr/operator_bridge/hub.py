from __future__ import annotations

import asyncio
import os

from .providers import PROVIDERS, provider_label
from .service import OperatorService
from .workspace import BridgeError


class OperatorHub:
    """One resident bridge; native providers remain separate actors."""
    def __init__(self, operators: dict[str, OperatorService]):
        if set(operators) != set(PROVIDERS):
            raise BridgeError("provider_configuration", "Configure distinct Copilot and Codex actors.")
        self.operators = operators
        first = operators["copilot"]
        self.workspace, self.instance_id = first.workspace, first.instance_id
        self.start_gate = asyncio.Lock()
        for provider, operator in operators.items():
            if operator.provider != provider or operator.workspace != self.workspace:
                raise BridgeError("provider_workspace_mismatch", "Both actors must use the same trusted primary checkout.")
            operator.instance_id = self.instance_id
            operator.journal.set("bridge_process", {"pid": os.getpid(), "instanceId": self.instance_id})

    def get(self, provider: str) -> OperatorService:
        provider_label(provider)
        return self.operators[provider]

    @property
    def app(self):
        return self.operators["copilot"].app

    async def run(self):
        for operator in self.operators.values():
            await operator.run()

    async def close(self):
        await asyncio.gather(*(operator.close() for operator in self.operators.values()))

    async def update_application(self, state: dict):
        for operator in self.operators.values():
            await operator.update_application(state)

    def conflicts(self, selected: str) -> list[str]:
        conflicts = []
        for provider, operator in self.operators.items():
            if provider == selected:
                continue
            native = operator.adapter.status()
            queued_start = operator.journal.db.execute(
                "SELECT 1 FROM commands WHERE kind='start_session' "
                "AND state IN ('queued','running','awaiting_permission') LIMIT 1").fetchone()
            if (operator.connected and operator.stop_outcome != "confirmed") or native.get("ownedPids") or queued_start:
                conflicts.append(provider)
        return conflicts

    async def submit(self, provider: str, principal: str, payload: dict) -> dict:
        operator = self.get(provider)
        operator.human(principal)
        kind, text = operator.validate_payload(payload)
        if kind != "start_session":
            return await operator.submit(principal, payload)
        # Serialize admission only, not native sessions or edits.
        async with self.start_gate:
            existing = operator.journal.existing(payload.get("id"), kind, text)
            if existing is not None or operator.connected:
                return await operator.submit(principal, payload)
            conflicts = self.conflicts(provider)
            if conflicts and not payload.get("startAnyway", False):
                raise BridgeError("operator_conflict",
                    "Another operator is active in the same checkout. We recommend one at a time; "
                    "concurrent editing can conflict and uses more resources.", details={
                        "conflicts": conflicts, "requiresConfirmation": True,
                        "allowedWithConfirmation": True, "workspace": self.workspace.root})
            command = await operator.submit(principal, payload)
            if conflicts:
                operator.journal.event("operator.concurrency_acknowledged", {
                    "commandId": command["id"], "conflicts": conflicts,
                    "message": "Human chose Start anyway. Native permissions remain separate; concurrent edits are not race-proof."})
                await operator.notify()
            return command

    def overview(self) -> dict:
        return {"schema": "powder.operators.v1",
                "bridge": {"online": True, "pid": os.getpid(), "instanceId": self.instance_id},
                "workspace": self.workspace.json(),
                "operators": [operator.status() for operator in self.operators.values()],
                "concurrencyPolicy": "warn-and-confirm-not-exclusive",
                "externalOperatorsTracked": False}
