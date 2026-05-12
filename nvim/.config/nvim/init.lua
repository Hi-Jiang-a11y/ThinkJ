-- vim:ft=lua
-- nvim/init.lua
-- @author nate zhou
-- @since 2025
-- @modified by NeoJuliet (2026)

require('config.juliet')
require('config.options')
require('config.bindings')

vim.opt.rtp:prepend(vim.fn.stdpath("data") .. "/lazy/lazy.nvim")
require("lazy").setup("plugins")
