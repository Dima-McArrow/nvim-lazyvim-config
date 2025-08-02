return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",
      "nvim-neotest/neotest-jest",
    },
    opts = function()
      -- Dynamically configure the jest adapter based on the project
      local jest_adapter_config = {
        jest_command = "npm test --", -- A safe default
      }
      -- Use the official lazyvim util to find the project root
      local root = require("lazyvim.util").root()

      if root then
        -- Check for different jest config files to make it universal
        if vim.fn.filereadable(root .. "/jest.config.cjs") == 1 then
          jest_adapter_config.jest_config_file = "jest.config.cjs"
        elseif vim.fn.filereadable(root .. "/jest.config.js") == 1 then
          jest_adapter_config.jest_config_file = "jest.config.js"
        end
      end

      -- The correct way to configure the adapter:
      -- by CALLING it inside the opts FUNCTION, which runs AFTER the plugin is loaded.
      return {
        adapters = {
          require("neotest-jest")(jest_adapter_config),
        },
      }
    end,
    keys = {
      { "<leader>tn", function() require("neotest").run.run() end, desc = "Run Nearest Test" },
      { "<leader>tf", function() require("neotest").run.run(vim.fn.expand("%")) end, desc = "Run Tests in File" },
      { "<leader>ts", function() require("neotest").summary.toggle() end, desc = "Toggle Test Summary" },
      { "<leader>to", function() require("neotest").output.open({ enter = true }) end, desc = "Show Test Output" },
      { "<leader>ta", function() require("neotest").run.attach() end, desc = "Attach to Test Process" },
      { "<leader>tS", function() require("neotest").run.stop() end, desc = "Stop Test Run" },
    },
  },
}