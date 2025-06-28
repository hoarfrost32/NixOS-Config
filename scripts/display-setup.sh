#!/usr/bin/env bash
set -euo pipefail

# We can use `xrandr` and `grep` directly because they will be
# provided by `runtimeInputs` in our Nix expression.
moncnt=$(xrandr --query | grep -c "connected")

if [ "$moncnt" -eq 2 ]; then
  # Docked/Multi-monitor setup
  xrandr --output DP-2 --mode 2560x1440 --rate 165 --primary \
         --output DP-4 --mode 1920x1080 --right-of DP-2
else
  # Laptop/Single-monitor setup
  xrandr --output DP-4 --mode 1920x1080 --primary
fi

echo "Display layout configured."