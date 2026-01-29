#!/bin/sh

set -eu

ARCH=$(uname -m)
VERSION=$(pacman -Q valot | awk '{print $2; exit}')
export ARCH VERSION
export OUTPATH=./dist
export ADD_HOOKS="self-updater.bg.hook"
export UPINFO="gh-releases-zsync|${GITHUB_REPOSITORY%/*}|${GITHUB_REPOSITORY#*/}|latest|*$ARCH.AppImage.zsync"
export ICON=PATH_OR_URL_TO_ICON
export DESKTOP=PATH_OR_URL_TO_DESKTOP_ENTRY

# Deploy dependencies
quick-sharun /usr/bin/valot

# Turn AppDir into AppImage
quick-sharun --make-appimage
