# autocommit

## 概要

autocommitは、InkscapeでSVGファイルを保存した際に自動でGitコミットし、SVGファイルをoutputディレクトリにPDF形式でエクスポートするツールです。すべてシェルスクリプトで実装されています。

## 主な機能

- SVGファイルの保存を自動検知しGitコミット
- SVGファイルをoutputディレクトリにPDFで自動エクスポート
- すべてシェルスクリプトで動作

## セットアップ

1. リポジトリをクローンします。

   ```sh
   git clone <このリポジトリのURL>
   cd autocommit
   ```

2. 依存パッケージをインストールします。
   - [entr](https://eradman.com/entrproject/)
   - [Inkscape](https://inkscape.org/)

   例（Debian/Ubuntu系の場合）:

   ```sh
   sudo apt install entr inkscape
   ```

## 使い方

1. このレポジトリを複製して監視したいSVGファイルをレポジトリに含めます。
2. `setup.sh`を実行して、監視と自動コミットの設定を行います。

   ```sh
   ./setup.sh
   ```

3. SVGファイルをInkscapeで保存すると、自動でGitコミットとPDFエクスポートが行われます。
4. `output`ディレクトリにエクスポートされたPDFファイルが保存されます。
