-- ============================================================================
-- Neovim 設定ファイル
-- - [1] 基本設定
-- - [2] プラグイン管理 (lazy.nvim)
-- - [3] プラグイン詳細設定 / 見た目
-- - [4] 自動レイアウト (VimEnter)
-- - [5] キーマップ
-- ============================================================================

-- [1] 基本設定 ---------------------------------------------------------------
vim.g.mapleader = " "
vim.opt.number = true
vim.opt.mouse = 'a'
vim.opt.clipboard = 'unnamedplus'
vim.opt.termguicolors = true
vim.opt.splitright = true
vim.opt.splitbelow = true

-- インデント関連
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- [2] プラグイン管理 (lazy.nvim) --------------------------------------------
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", lazypath
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  { "nvim-tree/nvim-tree.lua", dependencies = { "nvim-tree/nvim-web-devicons" } },
})

-- [3] プラグイン詳細設定 / 見た目 -------------------------------------------
vim.cmd.colorscheme "catppuccin-mocha"

require("nvim-tree").setup({
  view = { width = 30 },
  renderer = {
    icons = { show = { file = true, folder = true } }
  },
})

-- 背景透過 (WezTerm 側の透明度と合わせる)
local function transparent_background()
  local groups = { "Normal", "NormalFloat", "NvimTreeNormal", "NvimTreeNormalNC" }
  for _, group in ipairs(groups) do
    vim.api.nvim_set_hl(0, group, { bg = "none" })
  end
end
transparent_background()

-- [4] 自動レイアウト (VimEnter) ---------------------------------------------
-- 起動時に「左: NvimTree / 中: エディタ / 右: aichat」の3ペインを構成する
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    vim.cmd("NvimTreeOpen")
    vim.cmd("wincmd l")
  end,
})

-- [5] キーマップ -------------------------------------------------------------
vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>', { silent = true })

vim.keymap.set('n', '<leader>q', ':qa<CR>', { silent = true })

-- 画面移動: Ctrl + 十字キー
-- ノーマル / ターミナルの両方から同じ操作でペイン移動できるようにする
local move_keys = {
  ['<C-Left>']  = 'h',
  ['<C-Down>']  = 'j',
  ['<C-Up>']    = 'k',
  ['<C-Right>'] = 'l',
}

for key, dir in pairs(move_keys) do
  vim.keymap.set('n', key, '<C-w>' .. dir, { silent = true })
  vim.keymap.set('t', key, [[<C-\><C-n><C-w>]] .. dir, { silent = true })
end

vim.keymap.set('t', '<Esc>', [[<C-\><C-n>]], { silent = true })