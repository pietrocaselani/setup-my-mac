#!/usr/bin/env bash

eval "$(rbenv init -)"

### Functions ###

function devfolder() {
    cd "$DEV_FOLDER" || exit 1
}

function personaldevfolder() {
    devfolder
    cd Personal || exit 1
}

function xcode-kill() {
    killall Xcode
    xcrun -k
    xcodebuild -alltargets clean
    rm -rf "$(getconf DARWIN_USER_CACHE_DIR)/org.llvm.clang/ModuleCache"
    rm -rf "$(getconf DARWIN_USER_CACHE_DIR)/org.llvm.clang.$(whoami)/ModuleCache"
    rm -rf ~/Library/Developer/Xcode/DerivedData/*
    rm -rf ~/Library/Caches/com.apple.dt.Xcode/*
}

function record-simulator() {
    name=${1:-"movie"}
    xcrun simctl io booted recordVideo "${name}.mov"
}

function mov2gif() {
    ffmpeg -i "$1" -vf scale=320:-1 -r 10 -f gif -y "$1.gif"
}

function xcode-deriveddata-open() {
    open ~/Library/Developer/Xcode/DerivedData/
}

function simulator-delete-unavailables() {
    xcrun simctl delete unavailable
}

function killapp() {
	kill -9 "$(pgrep "$1" | grep -v grep | awk '{print $2}')"
}

function isrunning() {
	pgrep -i "$1"
}

function password() {
    count=${1:-20}
    echo "$(LC_ALL=C tr -dc "[:graph:]" < /dev/urandom | head -c ${count})"
}

function login-items-list() {
    osascript -e 'tell application "System Events" to get the name of every login item'
}

function git-parent-branch() {
	current_branch=$(git rev-parse --abbrev-ref HEAD)
	git show-branch -a | awk -F'[]^~[]' '/\*/ && !/'"$current_branch"'/ {print $2;exit}'
}

function git-untrack-file() {
	git update-index --assume-unchanged $1
}

function git-trackfile() {
	git update-index --no-assume-unchanged $1
}

function fix-sound() {
    sudo launchctl stop com.apple.audio.coreaudiod && sudo launchctl start com.apple.audio.coreaudiod
}

### End Functions ###

### Env Vars ###

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export DEV_FOLDER=${HOME}/Documents/Dev

### End Env Vars ###

### Aliases ###

alias la="ls -laish"
alias ip="ifconfig | grep \"inet \" | grep -v 127.0.0.1 | cut -d\  -f2"

### End Aliases ###
