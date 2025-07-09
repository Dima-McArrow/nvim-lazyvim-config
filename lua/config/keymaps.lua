-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("v", "<leader>y", '"+y', { desc = "Yank to clipboard" })

-- Fix for indent rainbow issues
vim.keymap.set("n", "<leader>ir", function()
  require("ibl").refresh()
  vim.cmd("syntax sync fromstart")
  vim.notify("Indent lines refreshed!", vim.log.levels.INFO)
end, { desc = "Refresh indent lines" })
