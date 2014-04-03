#!/usr/bin/env bash

XCODE_TEMPLATES_DIR="$HOME/Library/Developer/Xcode/Templates/File Templates/Route Builder"
TEMPLATE_DIR="./Templates/Route Builder/"

mkdir -p $XCODE_TEMPLATES_DIR
cp -R "$TEMPLATE_DIR" "$XCODE_TEMPLATES_DIR"
