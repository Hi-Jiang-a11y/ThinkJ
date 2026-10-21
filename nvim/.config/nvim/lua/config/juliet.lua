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

local juliet_pink = '#ffb6c1'
local lavender    = '#DCD0FF'
local deep_bg     = '#191919'
local selection   = '#75506f'

--stylua: ignore start

hi('StatusLine',   { fg = 'White', bg = '#682c82', reverse = false, bold = true, cterm = { reverse = false, bold = true }})
hi('StatusLineNC', { fg = 'White', bg = '#5f676a', reverse = false, cterm = { reverse = false } })
hi('MsgSeparator', { link = 'StatusLine' })

hi('Normal',       { fg = 'White'})
hi('Visual',       { fg = 'white', bg = selection, ctermfg = 'Black', ctermbg = 'Grey' })
hi('Search',       { fg = 'Black', bg = '#f57ae1', ctermfg = 'Black', ctermbg = 'Yellow' })
hi('CurSearch',    { fg = 'Black', bg = juliet_pink, bold = true })
hi('CursorLine',   { bg = '#24202b' })
hi('CursorColumn', { bg = '#2d2638' })
hi('CursorLineNr', { fg = '#f5b8eb', bold = true })
hi('LineNr',       { fg = 'Grey' })

hi('Pmenu',        { bg = deep_bg, fg = 'White' })
hi('PmenuSel',     { bg = '#427b58', fg = 'White', bold = true })
hi('PmenuKind',    { link = 'Pmenu' })
hi('PmenuKindSel', { link = 'PmenuSel' })

hi('Comment',      { fg = 'Grey', italic = true })
hi('Constant',     { fg = lavender })
hi('String',       { fg = '#9ece6a' })
hi('Identifier',   { fg = '#ff5577', bold = true })
hi('Function',     { fg = '#bb9af7' })
hi('Statement',    { fg = juliet_pink, bold = true })
hi('Type',         { fg = '#60ff60', bold = true })
hi('PreProc',      { fg = '#ff80ff' })
hi('Special',      { fg = 'Orange' })
hi('Delimiter',    { fg = 'White' })

hi('@variable',          { fg = 'White' })
hi('@variable.member',   { fg = '#7dcfff' })
hi('@property',          { fg = '#7dcfff' })
hi('@keyword',           { link = 'Statement' })
hi('@function.builtin',  { fg = juliet_pink })
hi('@constant.builtin',  { fg = lavender })

hi('DiffAdd',      { fg = 'white', bg = 'Green' })
hi('DiffChange',   { fg = 'white', bg = '#6f3f89' })
hi('DiffDelete',   { fg = 'Blue', bg = 'DarkCyan', bold = true })
hi('DiffText',     { fg = 'white', bg = '#ce104c', bold = true })
hi('Title',        { fg = '#c85577', bold = true })
hi('WarningMsg',   { fg = '#e6da00' })
hi('ErrorMsg',     { fg = 'White', bg = 'Red' })

hi('DiagnosticError', { fg = 'Red' })
hi('DiagnosticWarn',  { fg = 'Orange' })
hi('DiagnosticInfo',  { fg = 'LightBlue' })
hi('DiagnosticHint',  { fg = lavender })

hi('TabLineSel',  { fg = 'White', bg = '#682c82', reverse = false, bold = true, cterm = { reverse = false, bold = true } })
hi('TabLine',     { fg = 'White', bg = '#5f676a', reverse = false, cterm = { reverse = false } })
hi('TabLineFill', { bg = 'NONE', ctermbg = 'NONE' })
