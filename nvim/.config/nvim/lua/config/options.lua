-- vim:ft=lua
-- nvim/lua/config/options.lua
-- @author nate zhou
-- @since 2025,2026
-- @modified by NeoJuliet (2026)

vim.o.encoding = 'utf-8' -- global encoding

vim.o.timeoutlen = 300

vim.o.mouse = 'a'

vim.o.clipboard = 'unnamedplus' -- use system clipboard for all yank, delete, change and put

vim.o.scrolloff = 4 -- always keep 10 lines spacing between top and bot

vim.o.ignorecase = true -- searching case insensitive
vim.o.smartcase = true	-- except patterns contain uppercase

-- %f: path, %h: help flag, %m: modified flag, %r: readonly flag
-- %=: separation point, %l/%L: current line/total lines, %P: percentage
vim.o.statusline = '%f %h%m%r%= %-16.(%)  [%l/%L %P]'
vim.o.statusline = table.concat({
  " ",
  "%f",
  "%m",
  "%r",
  "%h",
  "%w",
  " ",
  "%=",
  "%#Directory#",
  " %{&filetype != '' ? &filetype : 'no ft'} ",
  "%#Type#",
  " %{&fileencoding != '' ? &fileencoding : &encoding} ",
  "%#Number#",
  " %P",
  "%#Statement#",
  " [%l/%L]",
})
vim.o.laststatus = 2 -- always show the status line

vim.o.number = true -- show absolute line number
vim.o.relativenumber = true -- show relative line number

vim.o.cursorline = true -- highlight current line
vim.o.cursorcolumn = true -- highlight current column

vim.cmd('syntax on') -- syntax highlight

vim.o.termguicolors = true -- enable 24-bit RGB color in the tui
vim.o.background = 'dark' -- use colors that look good on a dark background
vim.o.signcolumn = "yes" -- always show the sign column

vim.cmd('match TrailingSpace /\\s\\+$/')
vim.cmd('highlight TrailingSpace ctermbg=gray guibg=gray')

vim.o.expandtab = true -- <Tab> expands spaces instead of \t
vim.o.tabstop = 4 -- 4 spaces per <Tab>
vim.o.shiftwidth =4 --4 spaces per indentation level
vim.o.smartindent = true -- indentation is aware of newline insert
vim.o.wrap = true

vim.o.splitbelow = true -- horizontal splits will automatically be below
vim.o.splitright = true -- vertical splits will automatically be to the right

-- tab bar
function _G.MyTabLine()
  local s = ''
  for i = 1, vim.fn.tabpagenr('$') do
    local is_sel = (i == vim.fn.tabpagenr())
    s = s .. (is_sel and '%#TabLineSel#' or '%#TabLine#')
    s = s .. '%' .. i .. 'T'
    
    local bufnr = vim.fn.tabpagebuflist(i)[vim.fn.tabpagewinnr(i)]
    local name = vim.fn.bufname(bufnr)
    name = (name == '') and '[No Name]' or vim.fn.fnamemodify(name, ':t')
    
    s = s .. ' ' .. i .. ':' .. name .. ' '
  end
  return s .. '%#TabLineFill#%T'
end

vim.opt.tabline = '%!v:lua.MyTabLine()'
