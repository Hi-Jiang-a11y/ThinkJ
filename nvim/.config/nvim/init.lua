-- vim:ft=lua
-- nvim/init.lua
-- @author nate zhou
-- @since 2025
-- @modified by NeoJuliet (2026)

require('config.juliet')
require('config.options')
require('config.bindings')

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
  local output = vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })

  if vim.v.shell_error ~= 0 then
    error("Failed to install lazy.nvim:\n" .. output)
  end
end

vim.opt.rtp:prepend(lazypath)
require("lazy").setup("plugins")
