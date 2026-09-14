"""Test-only JSON peer. It is not Codex and cannot run commands or models."""
import json
import os
import sys
import uuid

thread_id = None
fork_parent = None
experimental = False


def output(value):
    print(json.dumps(value), flush=True)


def notice(method, **params):
    output({"method": method, "params": params})


def thread(identifier=None):
    identifier = identifier or thread_id
    return {"id": identifier, "cwd": os.getcwd(), "status": {"type": "idle"},
            "ephemeral": False, "gitInfo": {"branch": "master"},
            "forkedFromId": fork_parent if identifier == thread_id else None}


def complete(status="completed"):
    notice("turn/completed", threadId=thread_id,
           turn={"id": "fixture-turn", "status": status, "items": []})


initialized = False
pending = None
print("secret=private-native-diagnostic", file=sys.stderr, flush=True)
for line in sys.stdin:
    message = json.loads(line)
    if "method" not in message:
        if message.get("id") == "approval-1":
            decision = (message.get("result") or {}).get("decision", "decline")
            notice("item/completed", threadId=thread_id, turnId="fixture-turn",
                   item={"type": "agentMessage", "id": "answer", "text": "permission " + decision})
            complete()
        continue
    method, params = message["method"], message.get("params") or {}
    if method == "initialized":
        initialized = True
        continue
    if method == "initialize":
        experimental = params.get("capabilities", {}).get("experimentalApi", False)
        result = {"userAgent": "fixture-not-codex"}
    elif not initialized:
        output({"id": message["id"], "error": {"code": -1, "message": "initialized required"}})
        continue
    elif method in ("thread/start", "thread/resume", "thread/fork"):
        if method == "thread/fork":
            assert experimental and params["deferGoalContinuation"] is True and params["excludeTurns"] is True
            assert params["ephemeral"] is False and params["sandbox"] == "read-only"
            assert params["approvalPolicy"] == "untrusted" and params["approvalsReviewer"] == "user"
            fork_parent = params["threadId"]
        else:
            fork_parent = None
        thread_id = params["threadId"] if method == "thread/resume" else "fixture-" + str(uuid.uuid4())
        result = {"thread": thread(), "cwd": params["cwd"], "approvalPolicy": "untrusted",
                  "approvalsReviewer": "user", "sandbox": {"type": "readOnly", "networkAccess": False}}
    elif method == "thread/read":
        result = {"thread": thread(params["threadId"])}
    elif method == "turn/start":
        result = {"turn": {"id": "fixture-turn", "status": "inProgress", "items": []}}
    elif method == "turn/interrupt":
        result = {}
    else:
        output({"id": message["id"], "error": {"code": -32601, "message": "unsupported"}})
        continue
    output({"id": message["id"], "result": result})
    if method == "turn/start":
        text = params["input"][0]["text"]
        notice("turn/started", threadId=thread_id,
               turn={"id": "fixture-turn", "status": "inProgress", "items": []})
        if text == "permission":
            output({"id": "approval-1", "method": "item/commandExecution/requestApproval",
                    "params": {"threadId": thread_id, "turnId": "fixture-turn",
                               "itemId": "command-1", "startedAtMs": 0,
                               "command": "fixture-only, never executed", "cwd": os.getcwd()}})
        elif text == "hang":
            pass
        elif text == "exit":
            break
        else:
            notice("item/completed", threadId="another-thread", turnId="fixture-turn",
                   item={"type": "agentMessage", "id": "foreign", "text": "must not leak"})
            notice("item/completed", threadId=thread_id, turnId="fixture-turn",
                   item={"type": "agentMessage", "id": "answer", "text": "fixture output"})
            complete("failed" if text == "fail" else "completed")
    elif method == "turn/interrupt":
        complete("interrupted")
