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
2. `setup.sh`を実行して、監視と自動コミットを開始します。

   ```sh
   ./setup.sh
   ```

3. SVGファイルをInkscapeで保存すると、自動でGitコミットとPDFエクスポートが行われます。
4. `output`ディレクトリにエクスポートされたPDFファイルが保存されます。

## GitHub Actionsによる自動PDFエクスポートとリリース

GitHub Actionsを利用して、SVGファイルの変更時に自動でPDFへエクスポートし、生成されたPDFをGitHubリリースに自動で追加する機能も備えています。これにより、手動でPDFを生成・配布する手間が省けます。

リポジトリにpushすると、自動的にPDFがエクスポートされ、最新のGitHubリリースに追加されます。

この機能を利用するには、`.github/workflows/`ディレクトリ内のワークフローファイルをカスタマイズし、リポジトリのSecretsに必要な環境変数を設定してください。
