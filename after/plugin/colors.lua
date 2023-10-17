function Color(color)
	color = color or "rose-pine-moon"
	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

	if vim.fn.exists("g:neovide") then
		vim.g.neovide_transparency = 0.8
		vim.o.guifont = "JetBrainsMonoNL NF"
	end
end

Color()
