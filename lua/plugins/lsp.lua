return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      tailwindcss = {
        cmd = { "tailwindcss-language-server", "--stdio" },
      },
    },
  },
}
