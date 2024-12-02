#!/bin/bash

# Перевірка, чи вказаний шлях до цільової директорії
if [ -z "$1" ]; then
  echo "Будь ласка, вкажіть шлях до цільової директорії."
  exit 1
fi

TARGET_DIR="$1"

if [ ! -d "$TARGET_DIR" ]; then
  echo "Директорія $TARGET_DIR не існує."
  exit 1
fi

for ITEM in "$TARGET_DIR"/*; do
  if [ -d "$ITEM" ]; then
    echo "$(basename "$ITEM") є директорією."
  elif [ -f "$ITEM" ]; then
    BASENAME=$(basename "$ITEM")
    NEW_DIR="${TARGET_DIR}/${BASENAME}_dir"
    mkdir -p "$NEW_DIR"
    mv "$ITEM" "$NEW_DIR"
    echo "$BASENAME переміщений до ${BASENAME}_dir."
  fi
done
