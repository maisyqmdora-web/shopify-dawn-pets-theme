#!/bin/sh
set -eu

DOC_PATH="THEME_FEATURES_CN.md"
SECTION_TITLE="## 10. 功能更新日志"

if [ ! -f "$DOC_PATH" ]; then
  echo "未找到 $DOC_PATH" >&2
  exit 1
fi

if [ "$#" -lt 1 ]; then
  echo "用法: ./scripts/append-theme-feature-log.sh 功能说明" >&2
  exit 1
fi

if ! grep -Fq "$SECTION_TITLE" "$DOC_PATH"; then
  echo "未找到日志区块: $SECTION_TITLE" >&2
  exit 1
fi

FEATURE_DESC="$*"
TODAY="$(date +%Y-%m-%d)"
ENTRY="- ${TODAY}：${FEATURE_DESC}"

printf "\n%s\n" "$ENTRY" >> "$DOC_PATH"
echo "已追加: $ENTRY"
