return {
  "theprimeagen/harpoon",
  enabled = true,
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local harpoon = require("harpoon")
    harpoon:setup()

    -- Main harpoon keymaps, prefixed with <leader>h
    vim.keymap.set("n", "<leader>h", function() harpoon:list():add() end, { desc = "Harpoon file" })
    vim.keymap.set("n", "<leader>hm", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = "Harpoon [m]enu" })

    -- Navigation
    vim.keymap.set("n", "<leader>hj", function() harpoon:list():next() end, { desc = "Harpoon [j]ump to next" })
    vim.keymap.set("n", "<leader>hk", function() harpoon:list():prev() end, { desc = "Harpoon [k]ump to previous" })

    -- Quick selection
    vim.keymap.set("n", "<leader>h1", function() harpoon:list():select(1) end, { desc = "Harpoon to file 1" })
    vim.keymap.set("n", "<leader>h2", function() harpoon:list():select(2) end, { desc = "Harpoon to file 2" })
    vim.keymap.set("n", "<leader>h3", function() harpoon:list():select(3) end, { desc = "Harpoon to file 3" })
    vim.keymap.set("n", "<leader>h4", function() harpoon:list():select(4) end, { desc = "Harpoon to file 4" })
  end,
}