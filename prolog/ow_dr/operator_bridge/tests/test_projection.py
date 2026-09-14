import copy
import json
import unittest

from ..projection import COMMAND_PAGE, MAX_SNAPSHOT_BYTES, encode_snapshot, project_status
from .support import fixture, remove


class ProjectionTests(unittest.TestCase):
    def setUp(self):
        self.directory, self.journal, _, self.service = fixture()

    def tearDown(self):
        self.journal.close()
        remove(self.directory)

    def test_unicode_command_history_is_bounded_without_rewriting_journal(self):
        text = "\u6f22" * 4096
        for index in range(100):
            self.journal.submit(f"unicode-{index}", "prompt", text)
            self.journal.state(f"unicode-{index}", "complete")
        original = self.service.status()
        self.assertGreater(len(json.dumps(original).encode()), 2 * 1024 * 1024)
        cursor, seen = 0, []
        while cursor < self.journal.latest():
            payload, next_cursor = encode_snapshot("copilot", original, self.journal.events(cursor), cursor)
            self.assertLessEqual(len(payload), MAX_SNAPSHOT_BYTES)
            frame = json.loads(payload)
            self.assertEqual(len(frame["data"]["commands"]), COMMAND_PAGE)
            self.assertTrue(all("preview" not in command for command in frame["data"]["commands"]))
            self.assertGreater(next_cursor, cursor)
            seen.extend(event["sequence"] for event in frame["events"])
            cursor = next_cursor
        self.assertEqual(seen, list(range(1, 201)))
        self.assertEqual(self.journal.command("unicode-0")["preview"], text)
        self.assertEqual(self.journal.events(0)["events"][0]["data"]["text"], text)
        self.assertEqual(self.journal.existing("unicode-0", "prompt", text)["state"], "complete")
        self.assertEqual(original, self.service.status())

    def test_full_snapshot_accounts_for_controls_metadata_permissions_and_events(self):
        status = self.service.status()
        huge = "\0" * 4096
        oversized_record = {(str(index) + huge): huge for index in range(32)}
        for key in ("workspace", "bridge", "application", "adapter"):
            status[key] = copy.deepcopy(oversized_record)
        status["adapter"].update({"ownedPids": [huge] * 32, "executable": oversized_record})
        status["commands"] = [{"id": huge, "kind": huge, "state": huge, "created": huge, "preview": huge} for _ in range(100)]
        status["permissions"] = [{"id": str(i), "title": huge, "detail": huge} for i in range(100)]
        event = {"sequence": 1, "created": 0, "kind": "assistant.output", "data": {"text": "\0" * (1024 * 1024)}}
        status_before, event_before = copy.deepcopy(status), copy.deepcopy(event)
        payload, cursor = encode_snapshot("copilot", status, {"events": [event], "latestSequence": 1}, 0)
        self.assertLessEqual(len(payload), MAX_SNAPSHOT_BYTES)
        frame = json.loads(payload)
        self.assertEqual(cursor, 1)
        self.assertTrue(frame["events"][0]["displayOmitted"])
        self.assertGreater(frame["data"]["displayProjection"]["permissionsOmitted"], 0)
        for permission in frame["data"]["permissions"]:
            self.assertEqual(permission["detail"], huge, "Displayed approvals are never truncated.")
        self.assertEqual(status, status_before)
        self.assertEqual(event, event_before)

    def test_oversized_permission_is_omitted_whole_not_offered_as_partial_approval(self):
        status = self.service.status()
        status["permissions"] = [{"id": "oversized", "title": "fixture", "detail": "x" * (1024 * 1024)}]
        projected = project_status(status)
        self.assertEqual(projected["permissions"], [])
        self.assertEqual(projected["displayProjection"]["permissionsOmitted"], 1)

    def test_surrogates_are_serialized_as_valid_utf8_json_without_looping(self):
        batch = {"events": [{"sequence": 1, "created": 0, "kind": "assistant.output",
                            "data": {"text": "\ud800"}}], "latestSequence": 1}
        payload, cursor = encode_snapshot("copilot", self.service.status(), batch, 0)
        self.assertEqual(json.loads(payload)["events"][0]["data"]["text"], "\ud800")
        self.assertEqual(cursor, 1)


if __name__ == "__main__":
    unittest.main()
