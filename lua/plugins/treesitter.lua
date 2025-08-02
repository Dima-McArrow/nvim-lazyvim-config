return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      -- Ensure astro and other needed parsers are installed
      vim.list_extend(opts.ensure_installed or {}, {
        "astro",
        "html",
        "css",
        "scss",
        "javascript",
        "typescript",
        "tsx",
        "json",
        "yaml",
        "toml",
        "lua",
        "markdown",
        "markdown_inline",
        "bash",
        "vim",
        "regex",
        "python",
      })

      -- Better indent support
      opts.indent = opts.indent or {}
      opts.indent.enable = true

      -- Astro specific configuration
      opts.highlight = opts.highlight or {}
      opts.highlight.enable = true
      opts.highlight.additional_vim_regex_highlighting = false

      return opts
    end,
  },
} 