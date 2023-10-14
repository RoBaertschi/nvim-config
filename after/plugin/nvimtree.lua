local function on_attach(bufnr)
  local api = require "nvim-tree.api"

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  api.config.mappings.default_on_attach(bufnr)
end

require("nvim-tree").setup { on_attach = on_attach, prefer_startup_root = true, sync_root_with_cwd = true }
local api = require"nvim-tree.api"

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.keymap.set("n", '<leader>et', api.tree.toggle)
vim.keymap.set("n", '<leader>ef', api.tree.focus)
