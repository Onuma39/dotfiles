# 🔧 Dotfiles

> 個人用開発環境設定リポジトリ

## ✨ 構成ファイル
- **Neovim (`nvim/init.lua`)**
  - `lazy.nvim` を用いたプラグイン管理と、`VimEnter` による自動レイアウト設定
  - セクション構成: `[1] 基本` `[2] プラグイン管理` `[3] 詳細/見た目` `[4] 自動レイアウト` `[5] キーマップ`
- **WezTerm (`wezterm/.wezterm.lua`)**
  - PowerShell の設定
  - Neovim の背景透過と調和するウィンドウ・フォント設定
- **統一された運用ルール**
  - 全ファイルで共通のコメントスタイルとセクション管理を採用

## 🚀 想定環境
| Category | Specification |
| :--- | :--- |
| **Target OS** | Windows 10/11 |
| **Terminal** | WezTerm (Optional: WSL Connection) |
| **Editor** | Neovim |
| **Manager** | lazy.nvim |

## 📦 セットアップ
### 1. リポジトリをクローン
```bash
git clone git@github.com:YOUR_NAME/dotfiles.git
```

### 2. Neovim 設定の反映例
- **Windows**:
  - `C:\Users\<USER>\AppData\Local\nvim\init.lua` へコピー or シンボリックリンク

### 3. WezTerm 設定の反映例
- **Windows**:
  - `C:\Users\<USER>\.wezterm.lua` から `wezterm/.wezterm.lua` を読み込むようにするか、直接コピー