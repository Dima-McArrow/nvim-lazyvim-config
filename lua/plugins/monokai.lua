return {
  {
    "polirritmico/monokai-nightasty.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd("colorscheme monokai-nightasty")
      -- Change the Comment color
      vim.api.nvim_set_hl(0, "Comment", { fg = "#a1ffc3" }) -- Apply mint green color to comments

      -- Create a custom autocommand to target specifically the "---" in frontmatter
      vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
        pattern = { "*.md", "*.astro", "*.yaml", "*.yml" }, -- Add file types that have frontmatter
        callback = function()
          -- Create a custom highlight group for frontmatter delimiters
          vim.api.nvim_set_hl(0, "FrontmatterDelimiter", { fg = "#ffc2e2" })

          -- Use vim's match functionality to target specifically the "---" pattern
          vim.fn.matchadd("FrontmatterDelimiter", "^---$")
        end,
      })
    end,
  },
}
