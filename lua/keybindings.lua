require("FTerm").setup({ border = "rounded" })

vim.api.nvim_create_user_command("FTermOpen", require("FTerm").open, { bang = true })
vim.api.nvim_create_user_command("FTermClose", require("FTerm").exit, { bang = true })
vim.keymap.set("n", "<leader>tt", '<CMD>lua require("FTerm").toggle()<CR>')
vim.keymap.set("n", "<A-t>", '<CMD>lua require("FTerm").toggle()<CR>')
vim.keymap.set("t", "<A-t>", '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>')

vim.keymap.set("n", "<leader>to", "<CMD>FTermOpen<CR>")
vim.keymap.set("n", "<leader>tc", "<CMD>FTermClose<CR>")

vim.keymap.set("n", "<leader>tv", function()
	vim.cmd.vsplit("term://fish")
end)

vim.keymap.set("n", "<leader>ts", function()
	vim.cmd.split("term://fish")
end)

local fterm = require("FTerm")

local gitui = fterm:new({
	ft = "fterm_gitui", -- You can also override the default filetype, if you want
	cmd = "gitui",
	dimensions = {
		height = 0.9,
		width = 0.9,
	},
	border = "rounded",
})

-- Use this to toggle gitui in a floating terminal
vim.keymap.set("n", "<A-g>", function()
	gitui:toggle()
end)

local btop = fterm:new({
	ft = "fterm_btop",
	cmd = "btop",
	border = "rounded",
})

-- Use this to toggle btop in a floating terminal
vim.keymap.set("n", "<A-b>", function()
	btop:toggle()
end)
