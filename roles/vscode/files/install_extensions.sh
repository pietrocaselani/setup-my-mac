#!/usr/bin/env bash

EXTENSIONS=(
    "misogi.ruby-rubocop"
    "svanimpe.stencil"
    "dbaeumer.vscode-eslint"
    "wakatime.vscode-wakatime"
    "timonwong.shellcheck"
    "mohsen1.prettify-json"
    "mariomatheu.syntax-project-pbxproj"
)

for ext in ${EXTENSIONS[*]}; do
    code --install-extension "$ext"
done
