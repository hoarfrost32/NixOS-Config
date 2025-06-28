#!/usr/bin/env bash
set -euo pipefail

if [[ -z "${1:-}" ]]; then
  echo "Usage: $0 <service-name>"
  echo "Example: $0 picom.service"
  exit 1
fi

SERVICE_NAME="$1"

if systemctl --user is-active --quiet "$SERVICE_NAME"; then
  echo "Stopping '$SERVICE_NAME'..."
  systemctl --user stop "$SERVICE_NAME"
else
  echo "Starting '$SERVICE_NAME'..."
  systemctl --user start "$SERVICE_NAME"
fi