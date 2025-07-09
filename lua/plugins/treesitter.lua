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
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
      
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
    end,
  },
} 