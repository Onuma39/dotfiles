-- ============================================================================
-- WezTerm 設定ファイル
-- - [1] 接続設定 (WSL / PowerShell 切り替え)
-- - [2] 外観設定 (ウィンドウ / フォント)
-- - [3] 外観設定 (タブバー / 背景)
-- - [4] キー操作 (ショートカット)
-- ============================================================================

local wezterm = require 'wezterm'
local config = wezterm.config_builder()

-- [1] 接続設定 (WSL / PowerShell 切り替え) -------------------------------
local domains = wezterm.default_wsl_domains()
local has_almalinux = false

for _, domain in ipairs(domains) do
    if domain.name == 'WSL:AlmaLinux-9' then
        has_almalinux = true
        break
    end
end

if has_almalinux then
    config.default_domain = 'WSL:AlmaLinux-9'
else
    config.default_prog = { 'powershell.exe' }
end

-- [2] 外観設定 (ウィンドウ / フォント) ---------------------------------
config.window_background_opacity = 0.85

config.window_decorations = "RESIZE"

config.font_size = 11.0

config.font = wezterm.font 'JetBrains Mono'

-- [3] 外観設定 (タブバー / 背景) ----------------------------------------
config.show_new_tab_button_in_tab_bar = false

config.hide_tab_bar_if_only_one_tab = true

config.window_frame = {
  inactive_titlebar_bg = "none",
  active_titlebar_bg = "none",
}

config.window_background_gradient = {
  colors = { "#000000" },
}

-- [4] キー操作 (ショートカット) ------------------------------------------
config.keys = {
  {
    key = 'v',
    mods = 'CTRL',
    action = wezterm.action.PasteFrom 'Clipboard',
  },
  {
    key = 'c',
    mods = 'CTRL',
    action = wezterm.action.CopyTo 'Clipboard',
  },
  {
    key = 'h',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
  },
  {
    key = 'v',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
  },
  {
    key = 'x',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.CloseCurrentPane { confirm = false },
  },
  {
    key = 'W',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.CloseCurrentTab { confirm = false },
  },
}

return config