#!/usr/bin/env python3
"""Event-driven Dunst notification counter and history picker for Waybar."""

import json
import signal
import subprocess
import sys
import time


def dunstctl(*args):
    return subprocess.run(
        ["dunstctl", *args], text=True, capture_output=True, check=False
    )


def history():
    result = dunstctl("history")
    if result.returncode != 0:
        return []
    try:
        payload = json.loads(result.stdout)
    except json.JSONDecodeError:
        return []

    def notifications(value):
        if isinstance(value, list):
            return [item for child in value for item in notifications(child)]
        if isinstance(value, dict):
            if "id" in value:
                return [value]
            return [item for child in value.values() for item in notifications(child)]
        return []

    return notifications(payload)


def field(notification, name):
    value = notification.get(name, "")
    if isinstance(value, dict):
        value = value.get("data", "")
    if isinstance(value, list):
        value = " ".join(map(str, value))
    return str(value).replace("\n", " ").replace("\t", " ").strip()


def pending_count():
    """Count active notifications plus the notifications retained in history."""
    displayed = dunstctl("count", "displayed")
    try:
        active = int(displayed.stdout.strip()) if displayed.returncode == 0 else 0
    except ValueError:
        active = 0
    return active + len(history())


def print_count():
    print(pending_count(), flush=True)


def monitor():
    def refresh(_signum, _frame):
        print_count()

    signal.signal(signal.SIGUSR1, refresh)
    print_count()
    command = [
        "dbus-monitor",
        "--session",
        "interface='org.freedesktop.Notifications'",
    ]
    while True:
        process = subprocess.Popen(
            command,
            stdout=subprocess.PIPE,
            stderr=subprocess.DEVNULL,
            text=True,
        )
        assert process.stdout is not None
        for line in process.stdout:
            if "member=Notify" in line or "member=NotificationClosed" in line:
                # Notify is observed just before Dunst changes its state.
                time.sleep(0.2)
                print_count()
        process.wait()
        time.sleep(1)


def show_history():
    notifications = history()
    if not notifications:
        return

    entries = []
    notification_ids = []
    for notification in reversed(notifications):
        notification_id = field(notification, "id")
        if not notification_id:
            continue
        app = field(notification, "appname")
        summary = field(notification, "summary") or "(no title)"
        body = field(notification, "body")
        text = f"{app}: {summary}" if app else summary
        if body:
            text += f" — {body}"
        notification_ids.append(notification_id)
        entries.append(text)

    if not entries:
        return

    picker = subprocess.run(
        [
            "fuzzel",
            "--dmenu",
            "--prompt=Notifications> ",
            "--lines=12",
            "--width=90",
            "--index",
            "--no-run-if-empty",
        ],
        input="\n".join(entries) + "\n",
        text=True,
        capture_output=True,
        check=False,
    )
    selected = picker.stdout.strip()
    if selected.isdigit() and int(selected) < len(notification_ids):
        dunstctl("history-pop", notification_ids[int(selected)])


def clear_history():
    dunstctl("history-clear")
    subprocess.run(
        ["pkill", "-USR1", "-f", "dunst-notifications.py monitor"], check=False
    )


def main():
    if len(sys.argv) != 2 or sys.argv[1] not in {"monitor", "show", "clear"}:
        raise SystemExit("usage: dunst-notifications.py {monitor|show|clear}")
    if sys.argv[1] == "monitor":
        monitor()
    elif sys.argv[1] == "show":
        show_history()
    else:
        clear_history()


if __name__ == "__main__":
    main()
