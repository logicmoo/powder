"""Compatibility entry for the real host's nonserving native checkpoint tests.

The former surrogate temporary-HTTP candidate host has been retired. Both test
commands now exercise the actual host, private IPC and native process ownership.
"""
import unittest
from checkpoint_native_integration import NativeCheckpointWorkflow

if __name__ == "__main__":
    unittest.main(verbosity=2)
