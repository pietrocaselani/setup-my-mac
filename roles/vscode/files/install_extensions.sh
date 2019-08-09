#!/usr/bin/env bash

EXTENSIONS=(
    "misogi.ruby-rubocop"
    "svanimpe.stencil"
    "dbaeumer.vscode-eslint"
    "wakatime.vscode-wakatime"
    "timonwong.shellcheck"
)

for ext in ${EXTENSIONS[*]}; do
    code --install-extension "$ext"
done
