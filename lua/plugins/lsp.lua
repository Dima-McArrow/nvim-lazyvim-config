return {
  "neovim/nvim-lspconfig",
  opts = {
    -- Добавляем astro lsp сервер
    servers = {
      astro = {},
    },
    -- Эта функция будет вызвана для каждого сервера для его настройки
    setup = {
      -- Это специальная функция, которая будет вызвана для tsserver
      -- Она позволяет нам изменять опции перед запуском сервера
      tsserver = function(_, opts)
        -- если таблицы filetypes не существует, создаем ее
        opts.filetypes = opts.filetypes or {}
        -- добавляем astro в filetypes
        table.insert(opts.filetypes, "astro")
        -- возвращаем false, чтобы lazyvim продолжил стандартную настройку
        return false
      end,
      -- Делаем то же самое для tailwindcss
      tailwindcss = function(_, opts)
        opts.filetypes = opts.filetypes or {}
        table.insert(opts.filetypes, "astro")
        return false
      end,
    },
  },
}