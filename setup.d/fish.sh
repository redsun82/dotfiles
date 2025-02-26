#!/bin/bash -eu

CONFIG=~/.config/fish

mkdir -p "$CONFIG"
EXISTING_USER_PATHS="$(grep "SETUVAR fish_user_paths" "$CONFIG/fish_variables" 2>/dev/null || true)"
cp -fTr fish "$CONFIG"
if [[ -n "$EXISTING_USER_PATHS" ]]; then
  echo "$EXISTING_USER_PATHS" >> "$CONFIG/fish_variables"
fi
