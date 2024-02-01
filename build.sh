#!/bin/bash

# ==== Directory structure ====
# top(current directory)
# - build.sh(here)
# - auth_key.txt(local only)
# - FOLDER1
#     - body.md
#     - description.txt
#     - ASSET
# - FOLDER2
#     - body.md
#     - description.txt
#     - ASSET
# - FOLDER3
#     - body.md
#     - description.txt
#     - ASSET
# - スクリプト //第一引数にディレクトリ名
#     - Package.swift
#     - Source/translateScript/aaaa.swift
#
# ==== Script ====
# translate FOLDER1
# translate FOLDER2
# translate FOLDER3

function translate() {
    pandoc "$1"/body.md -o "$1"/temporaryBody.html
    swift run --package-path スクリプト translateScript "$1"
    rm "$1"/temporaryBody.html
}

translate Plain将棋盤
translate TapTemperature
translate TapWeight
translate FadeInAlarm
translate MemorizeWidget
translate LockInNote
translate FlipByBlink
translate SpatialClock
translate HandsWidth
