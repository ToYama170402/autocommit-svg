#!/bin/sh -x

# スクリプトの引数としてファイルパスを受け取る
SVG_FILE=$1
SVG_FILE_BASENAME=$(basename "$SVG_FILE")

# ファイルパスが空の場合は何もしない
if [ -z "$SVG_FILE" ]; then
  echo "No file specified."
  exit 1
fi

echo "Change detected in ${SVG_FILE_BASENAME}. Committing..."

# 変更をステージングしてコミット
git add "${SVG_FILE}"
git commit -m "style(svg): Update ${SVG_FILE_BASENAME}"

COMMIT_INFO=$(git log --format=%ai%H -1 | sed 's/ /_/g' | sed 's/:/-/g')

SCRIPT_PATH=$(readlink -f "$0")
SCRIPT_DIR=$(dirname "${SCRIPT_PATH}")
inkscape "${SVG_FILE}" --export-filename="output/${SVG_FILE_BASENAME}_${COMMIT_INFO}.pdf" --export-text-to-path --export-area-page
