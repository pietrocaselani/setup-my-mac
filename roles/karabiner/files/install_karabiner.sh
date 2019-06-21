#!/usr/bin/env bash

version=$1
app_name="Karabiner-Elements-${version}"
dmg_name="${app_name}.dmg"
pkg_name="Karabiner-Elements.sparkle_guided.pkg"
pkg_path="${HOME}/Downloads/${app_name}/${pkg_name}"

echo "version = ${version}"
echo "app_name = ${app_name}"
echo "dmg_name = ${dmg_name}"

hdiutil attach "${HOME}/Downloads/${dmg_name}" -nobrowse -mountpoint "${HOME}/Downloads/${app_name}"

sudo installer -pkg ${pkg_path} -target /

hdiutil detach "${HOME}/Downloads/${app_name}"
rm -rf "${HOME}/Downloads/${dmg_name}"