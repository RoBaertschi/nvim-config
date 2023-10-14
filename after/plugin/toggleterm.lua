local tt = require("toggleterm")
local Terminal = require("toggleterm.terminal").Terminal


tt.setup {
  float_opts = {
    border = 'rounded'
  }
}

local floatterm = Terminal:new({ direction = "float" })

function _floatterm_toggle()
  floatterm:toggle()
end

vim.keymap.set("n", "<leader>tf", _floatterm_toggle)

local lazygit = Terminal:new({
  cmd = "lazygit",
  dir = "git_dir",
  direction = "float",
  float_opts = {
    border = "rounded",
  },
  -- function to run on opening the terminal
  on_open = function(term)
    vim.cmd("startinsert!")
    vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
  end,
  -- function to run on closing the terminal
  on_close = function(_term)
    vim.cmd("startinsert!")
  end,
})

local gitui = Terminal:new({
  cmd = "gitui",
  dir = "git_dir",
  direction = "float",
  float_opts = {
    border = "rounded",
  },
  -- function to run on opening the terminal
  on_open = function(term)
    vim.cmd("startinsert!")
    vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
  end,
  -- function to run on closing the terminal
  on_close = function(_term)
    vim.cmd("startinsert!")
  end,
})


function _lazygit_toggle()
  lazygit:toggle()
end

function _gitui_toggle()
  gitui:toggle()
end

vim.api.nvim_set_keymap("n", "<leader>tlg", "<cmd>lua _lazygit_toggle()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>tg", "<cmd>lua _gitui_toggle()<CR>", { noremap = true, silent = true })
