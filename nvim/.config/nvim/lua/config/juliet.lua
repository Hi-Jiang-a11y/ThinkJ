-- vim:ft=lua
-- nvim/lua/config/options.lua
-- @author NeoJuliet
-- @since 2026

vim.cmd.highlight('clear')
vim.g.colors_name = 'juliet'

local hi = function(name, val)
  val.force = true
  val.cterm = val.cterm or {}
  vim.api.nvim_set_hl(0, name, val)
end

-- 色彩變數定義 (引入 Juliet 與 Lavender)
local juliet_pink = '#ffb6c1'
local lavender    = '#DCD0FF'
local deep_bg     = '#191919'
local selection   = '#75506f'

--stylua: ignore start

-- 1. 保留你原始的 StatusLine (完全不動)
hi('StatusLine',   { fg = 'White', bg = '#682c82', reverse = false, bold = true, cterm = { reverse = false, bold = true }})
hi('StatusLineNC', { fg = 'White', bg = '#5f676a', reverse = false, cterm = { reverse = false } })
hi('MsgSeparator', { link = 'StatusLine' })

-- 2. 核心 UI 優化
hi('Normal',       { fg = 'White'})
hi('Visual',       { fg = 'white', bg = selection, ctermfg = 'Black', ctermbg = 'Grey' })
hi('Search',       { fg = 'Black', bg = '#f57ae1', ctermfg = 'Black', ctermbg = 'Yellow' })
hi('CurSearch',    { fg = 'Black', bg = juliet_pink, bold = true }) -- 當前搜尋結果更亮
hi('CursorLine',   { bg = '#000000' })
hi('CursorColumn', { bg = '#000000' })
hi('CursorLineNr', { fg = '#f5b8eb', bold = true })
hi('LineNr',       { fg = 'Grey' })

-- 3. 補全選單 (Pmenu) 配合你的 TUI 簡潔風格
hi('Pmenu',        { bg = deep_bg, fg = 'White' })
hi('PmenuSel',     { bg = '#427b58', fg = 'White', bold = true })
hi('PmenuKind',    { link = 'Pmenu' })
hi('PmenuKindSel', { link = 'PmenuSel' })

-- 4. 語法高亮 (融入粉/紫調)
hi('Comment',      { fg = 'Grey', italic = true })
hi('Constant',     { fg = lavender })           -- 常數改用薰衣草紫
hi('String',       { fg = '#9ece6a' })          -- 字串保持柔和綠
hi('Identifier',   { fg = '#ff5577', bold = true }) -- 識別碼 (變數等)
hi('Function',     { fg = '#bb9af7' })          -- 函數用明亮紫
hi('Statement',    { fg = juliet_pink, bold = true }) -- 關鍵字用 Juliet Pink
hi('Type',         { fg = '#60ff60', bold = true })
hi('PreProc',      { fg = '#ff80ff' })
hi('Special',      { fg = 'Orange' })
hi('Delimiter',    { fg = 'White' })

-- 5. TreeSitter 連結
hi('@variable',          { fg = 'White' })
hi('@variable.member',   { fg = '#7dcfff' })
hi('@property',          { fg = '#7dcfff' })
hi('@keyword',           { link = 'Statement' })
hi('@function.builtin',  { fg = juliet_pink })
hi('@constant.builtin',  { fg = lavender })

-- 6. 其他基礎設定 (繼承你原本的邏輯)
hi('DiffAdd',      { fg = 'white', bg = 'Green' })
hi('DiffChange',   { fg = 'white', bg = '#6f3f89' })
hi('DiffDelete',   { fg = 'Blue', bg = 'DarkCyan', bold = true })
hi('DiffText',     { fg = 'white', bg = '#ce104c', bold = true })
hi('Title',        { fg = '#c85577', bold = true })
hi('WarningMsg',   { fg = '#e6da00' })
hi('ErrorMsg',     { fg = 'White', bg = 'Red' })

-- 7. 診斷資訊
hi('DiagnosticError', { fg = 'Red' })
hi('DiagnosticWarn',  { fg = 'Orange' })
hi('DiagnosticInfo',  { fg = 'LightBlue' })
hi('DiagnosticHint',  { fg = lavender })

-- tab bar
hi('TabLineSel',  { fg = 'White', bg = '#682c82', reverse = false, bold = true, cterm = { reverse = false, bold = true } })
hi('TabLine',     { fg = 'White', bg = '#5f676a', reverse = false, cterm = { reverse = false } })
hi('TabLineFill', { bg = 'NONE', ctermbg = 'NONE' })
