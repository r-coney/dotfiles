# 🛠️ dotfiles

## 概要

macOS 開発環境のための設定ファイル群です。Neovim・VSCode・Homebrew・Zsh などのセットアップを自動化し、快適な開発体験を提供します。

## 特徴

- Neovim (v0.9.5) のカスタムビルド・プラグイン管理（[LazyVim](https://github.com/LazyVim/LazyVim)ベース）
- VSCode の拡張・設定の自動インストール
- Homebrew パッケージ管理（Brewfile 対応）
- Zsh のエイリアス・プロンプト・各種便利スクリプト
- シンボリックリンクによる設定ファイルの一元管理

## セットアップ

```sh
git clone https://github.com/r-coney/dotfiles.git
cd dotfiles
make all
```

### 個別セットアップ

| コマンド           | 内容                                   |
| ------------------ | -------------------------------------- |
| `make init`        | Xcode, Homebrew の初期セットアップ     |
| `make link`        | dotfiles のシンボリックリンク作成      |
| `make neovim0.9.5` | Neovim v0.9.5 の Homebrew Formula 適用 |
| `make brew`        | Brewfile によるパッケージインストール  |
| `make vscode`      | VSCode 拡張機能の自動インストール      |

## ディレクトリ構成

```
dotfiles/
├── .zshrc
├── .gitconfig
├── .scripts/         # 各種セットアップ・ユーティリティスクリプト
├── homebrew/         # Homebrew Formula/Brewfile
├── nvim/             # Neovim設定
├── vscode/           # VSCode設定
├── setUp/            # 初期セットアップ用スクリプト
└── ...
```

## カスタマイズ例

- Neovim のプラグインは[nvim/lua/plugins/](nvim/lua/plugins/)で管理
- Zsh エイリアスは[.zshrc](.zshrc)で定義
- Brewfile は[homebrew/.Brewfile](homebrew/.Brewfile)で管理

## 注意事項

- 本リポジトリは macOS 専用です
- Neovim は v0.9.5 に固定しています（VSCode-Neovim の互換性のため）
