#!/bin/sh

set -eu

ARCH=$(uname -m)
VERSION=$(pacman -Q valot | awk '{print $2; exit}')
export ARCH VERSION
export OUTPATH=./dist
export ADD_HOOKS="self-updater.bg.hook"
export UPINFO="gh-releases-zsync|${GITHUB_REPOSITORY%/*}|${GITHUB_REPOSITORY#*/}|latest|*$ARCH.AppImage.zsync"
export ICON=/usr/share/icons/hicolor/scalable/apps/com.odnoyko.valot.svg
export DESKTOP=/usr/share/applications/com.odnoyko.valot.desktop
export STARTUPWMCLASS=com.odnoyko.valot # Default to Wayland's wmclass. For X11, GTK_CLASS_FIX will force the wmclass to be the Wayland one.
export GTK_CLASS_FIX=1

# Deploy dependencies
quick-sharun /usr/bin/valot

# Turn AppDir into AppImage
quick-sharun --make-appimage
