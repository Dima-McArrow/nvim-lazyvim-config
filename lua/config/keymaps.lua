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

-- nvim-surround manual keymaps
vim.keymap.set("n", "ys", "<Plug>(nvim-surround-normal)", { desc = "Surround" })
vim.keymap.set("n", "yss", "<Plug>(nvim-surround-normal-cur)", { desc = "Surround line" })
vim.keymap.set("n", "ds", "<Plug>(nvim-surround-delete)", { desc = "Delete surround" })
vim.keymap.set("n", "cs", "<Plug>(nvim-surround-change)", { desc = "Change surround" })
vim.keymap.set("x", "S", "<Plug>(nvim-surround-visual)", { desc = "Surround selection" })

-- Neotest keymaps
-- vim.keymap.set("n", "<leader>tn", function() require("neotest").run.run() end, { desc = "Run nearest test" })
-- vim.keymap.set("n", "<leader>tf", function() require("neotest").run.run(vim.fn.expand("%")) end, { desc = "Run tests in current file" })
-- vim.keymap.set("n", "<leader>ts", function() require("neotest").summary.toggle() end, { desc = "Toggle test summary" })
-- vim.keymap.set("n", "<leader>to", function() require("neotest").output.open({ enter = true }) end, { desc = "Show test output" })
-- vim.keymap.set("n", "<leader>ta", function() require("neotest").run.attach() end, { desc = "Attach to test process" })
-- vim.keymap.set("n", "<leader>tS", function() require("neotest").run.stop() end, { desc = "Stop test run" })