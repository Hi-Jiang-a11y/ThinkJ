-- vim:ft=lua
-- nvim/lua/config/options.lua
-- @author nate zhou
-- @since 2025,2026
-- @modified by NeoJuliet (2026)

vim.g.mapleader = ' '

local function map(mode, keys, value)
	vim.keymap.set(mode, keys, value, { noremap = true })
end

map('n', '<leader>q', ':q!<CR>')
map('n', '<leader>b', ':buffers<CR>')

-- move multi-lines
map('v', 'J', ":m '>+1<CR>gv=gv")
map('v', 'K', ":m '<-2<CR>gv=gv")

-- completion
vim.cmd [[ cnoremap <expr> j pumvisible() ? "\<C-n>" : "j" ]]
vim.cmd [[ cnoremap <expr> k pumvisible() ? "\<C-p>" : "k" ]]
vim.cmd [[ cnoremap <expr> <Tab> pumvisible() ? "\<C-y><C-z>" : "\<C-z>" ]]
vim.cmd [[ cnoremap <expr> <Space> pumvisible() ? "\<C-e>" : " " ]]

map('i', '<C-f>', '<C-x><C-f>') -- start pathname suggestion
    vim.cmd [[ inoremap <expr> j pumvisible() ? "\<C-n>" : "j" ]]
    vim.cmd [[ inoremap <expr> k pumvisible() ? "\<C-p>" : "k" ]]
    vim.cmd [[ inoremap <expr> <Tab> pumvisible() ? "\<C-y>" : "\<Tab>" ]]
    vim.cmd [[ inoremap <expr> <Space> pumvisible() ? "\<C-e>" : " " ]]

-- split
map('n', '<leader>s', ':split<CR>')
map('n', '<leader>v', ':vsplit<CR>')

-- movement among windows
map('n', '<C-h>', ':wincmd h<CR>')
map('n', '<C-j>', ':wincmd j<CR>')
map('n', '<C-k>', ':wincmd k<CR>')
map('n', '<C-l>', ':wincmd l<CR>')

-- position
map('n', '<C-w>h', ':wincmd H<CR>')
map('n', '<C-w>j', ':wincmd J<CR>')
map('n', '<C-w>k', ':wincmd K<CR>')
map('n', '<C-w>l', ':wincmd L<CR>')

-- resize
map('n', '<leader>r', [[<C-w>=]])
map('n', '<leader>-', ':vertical resize -12<CR>')
map('n', '<leader>=', ':vertical resize +12<CR>')
map('n', '<leader>+', ':resize +6<CR>')
map('n', '<leader>_', ':resize -6<CR>')

-- tab
map('n', '<leader>O', ':tabnew<CR>')
map('n', '<leader>j', ':tabnext<CR>')
map('n', '<leader>k', ':tabprev<CR>')

-- toggle editor visuals
map('n', '<leader>c', ':set spell!<CR>')
map('n', '<leader>w', ':set wrap!<CR>')
map('n', '<leader>h', ':set hlsearch!<CR>')
map('n', '<leader>n', ':set relativenumber!<CR>')

map('n', '<leader>f', ':FZF<CR>')

-- terminal
map('n', '<leader>t', ':tabnew | terminal<CR>i')
map('t', '<Esc><Esc>', [[<C-\><C-n>]])
