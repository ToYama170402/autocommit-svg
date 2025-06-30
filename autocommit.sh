#!/bin/sh

# スクリプトの引数としてファイルパスを受け取る
SVG_FILE=$1

# ファイルパスが空の場合は何もしない
if [ -z "$SVG_FILE" ]; then
  echo "No file specified."
  exit 1
fi

echo "Change detected in ${SVG_FILE}. Committing..."

# 変更をステージングしてコミット
git add "${SVG_FILE}"
git commit -m "style(svg): Update ${SVG_FILE}"
