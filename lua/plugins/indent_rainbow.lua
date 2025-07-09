return {
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    event = { "BufReadPost", "BufNewFile", "BufWritePre" },
    opts = function(_, _)
      local hooks = require("ibl.hooks")

      -- Define rainbow colors
      local highlight = {
        "RainbowRed",
        "RainbowYellow", 
        "RainbowBlue",
        "RainbowOrange",
        "RainbowGreen",
        "RainbowViolet",
        "RainbowCyan",
      }

      -- Register the hook to set highlights
      hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
        vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
        vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
        vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
        vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
        vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
        vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
        vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
      end)

      return {
        indent = {
          highlight = highlight,
          char = "│", -- Explicit character instead of fallback
          tab_char = "│",
        },
        whitespace = {
          highlight = highlight,
          remove_blankline_trail = false,
        },
        scope = {
          enabled = false,
        },
        exclude = {
          filetypes = {
            "help",
            "alpha",
            "dashboard",
            "neo-tree", 
            "Trouble",
            "trouble",
            "lazy",
            "mason",
            "notify",
            "toggleterm",
            "lazyterm",
          },
        },
      }
    end,
    config = function(_, opts)
      require("ibl").setup(opts)
      
      -- Fix for inconsistent rendering - refresh on buffer events
      vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter", "TabEnter" }, {
        group = vim.api.nvim_create_augroup("indent_blankline_refresh", { clear = true }),
        callback = function()
          -- Small delay to ensure treesitter is loaded
          vim.defer_fn(function()
            if vim.bo.filetype ~= "" and vim.bo.buftype == "" then
              require("ibl").debounced_refresh(0)
            end
          end, 100)
        end,
      })
      
      -- Special handling for astro files
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "astro",
        group = vim.api.nvim_create_augroup("astro_indent_fix", { clear = true }),
        callback = function()
          vim.defer_fn(function()
            require("ibl").debounced_refresh(0)
          end, 200)
        end,
      })
    end,
    dependencies = {
      "TheGLander/indent-rainbowline.nvim",
    },
  },
}
