"""Private local line client. Credentials are read from a private file, never argv.

This connects to an existing app. It does NOT start a Prolog process.
"""
import argparse
import json
import os
from pathlib import Path
import socket
import sys


def load_credentials(path):
    data = json.loads(path.read_text(encoding="utf-8-sig"))
    if (data.get("version") != 1 or data.get("host") != "127.0.0.1"
            or not isinstance(data.get("pid"), int) or data["pid"] < 1
            or not isinstance(data.get("port"), int) or not 1 <= data["port"] <= 65535
            or not isinstance(data.get("token"), str) or len(data["token"]) != 64
            or any(ch not in "0123456789abcdef" for ch in data["token"])):
        raise ValueError("Invalid credential file")
    return data


class Connection:
    def __init__(self, credentials):
        self.socket = socket.create_connection(("127.0.0.1", credentials["port"]), timeout=5)
        self.buffer = b""
        try:
            self.until(b"AUTH required\n", maximum=1024)
            self.socket.sendall(b"AUTH " + credentials["token"].encode("ascii") + b"\r\n")
            response = self.until(b"\n", maximum=128)
            if response.strip() != b"OK":
                raise PermissionError("Authentication denied")
            self.socket.settimeout(35)
        except BaseException:
            self.socket.close()
            raise

    def until(self, marker, maximum=1_000_000):
        while marker not in self.buffer:
            block = self.socket.recv(4096)
            if not block:
                raise EOFError("Debug connection closed")
            self.buffer += block
            if len(self.buffer) > maximum:
                raise ValueError("Debug response limit exceeded")
        end = self.buffer.index(marker) + len(marker)
        result, self.buffer = self.buffer[:end], self.buffer[end:]
        return result

    def prompt(self):
        while True:
            for marker in (b"?- ", b"more (; / Enter): "):
                if marker in self.buffer:
                    return self.until(marker)
            block = self.socket.recv(4096)
            if not block:
                result, self.buffer = self.buffer, b""
                if result:
                    sys.stdout.write(result.decode("utf-8", errors="replace"))
                raise EOFError("Debug connection closed")
            self.buffer += block
            if len(self.buffer) > 1_000_000:
                raise ValueError("Debug response limit exceeded")

    def send(self, text):
        self.socket.sendall(text.encode("utf-8") + b"\r\n")

    def close(self):
        self.socket.close()


def locate_file(args):
    if args.credentials:
        return Path(args.credentials)
    root = Path(os.environ["LOCALAPPDATA"]) / "powder-local-debug"
    files = list(root.glob(f"{args.pid}-*/credentials.json"))
    if len(files) != 1:
        raise ValueError("Expected one active credential file; supply --credentials with its exact path")
    return files[0]


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    source = parser.add_mutually_exclusive_group(required=True)
    source.add_argument("--credentials", help="Owner-private credential file path (not the token)")
    source.add_argument("--pid", type=int, help="Existing app PID; never launches a process")
    parser.add_argument("--probe", action="store_true", help="Run only a read-only process/thread probe")
    args = parser.parse_args()
    connection = None
    try:
        if args.pid is not None and args.pid < 1:
            raise ValueError("PID must be positive")
        data = load_credentials(locate_file(args))
        connection = Connection(data)
        if args.probe:
            connection.prompt()
            connection.send("current_prolog_flag(pid, PID), thread_self(Thread).")
            answer = connection.prompt()
            sys.stdout.write(answer.decode("utf-8", errors="replace"))
            connection.send("end_of_file.")
        else:
            while True:
                sys.stdout.write(connection.prompt().decode("utf-8", errors="replace"))
                sys.stdout.flush()
                text = input()
                connection.send(text)
                if text.strip() == "end_of_file.":
                    break
        return 0
    except EOFError:
        if connection is None or args.probe:
            print("Debug connection closed before authentication/probe completed.", file=sys.stderr)
            return 1
        return 0
    except KeyboardInterrupt:
        return 0
    except (OSError, ValueError, KeyError):
        # Do not include exception/request representations: they may contain credentials.
        print("Unable to connect/authenticate. Check the private file, active app PID, and service port.",
              file=sys.stderr)
        return 1
    finally:
        if connection:
            connection.close()


if __name__ == "__main__":
    raise SystemExit(main())
