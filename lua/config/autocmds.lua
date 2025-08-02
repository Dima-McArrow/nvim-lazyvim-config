-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

vim.api.nvim_create_autocmd({"BufNewFile", "BufRead"}, {
  pattern = "*.astro",
  callback = function()
    vim.bo.filetype = "astro"
  end,
})

-- Fix for astro files - better indent detection
vim.api.nvim_create_autocmd("FileType", {
  pattern = "astro",
  group = vim.api.nvim_create_augroup("astro_treesitter_fix", { clear = true }),
  callback = function()
    -- Enable proper indentation for astro files
    vim.bo.indentexpr = "nvim_treesitter#indent()"
    vim.bo.autoindent = true
    vim.bo.smartindent = true

    -- Refresh syntax highlighting
    vim.defer_fn(function()
      vim.cmd("syntax sync fromstart")
    end, 100)
  end,
})
