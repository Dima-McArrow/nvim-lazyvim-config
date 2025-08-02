return {
  "nvim-telescope/telescope.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  cmd = "Telescope",
  keys = {
    {
      "<leader>fd",
      function()
        require("telescope.builtin").lsp_definitions()
      end,
      desc = "LSP Definitions (Telescope)",
    },
  },
}
