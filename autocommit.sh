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

COMMIT_HASH=$(git log --format=%H -1)

SCRIPT_PATH=$(readlink -f "$0")
SCRIPT_DIR=$(dirname "${SCRIPT_PATH}")
inkscape "${SVG_FILE}" --export-filename="${SCRIPT_DIR}/output/${SVG_FILE}_${COMMIT_HASH}.pdf" --export-text-to-path --export-area-page
