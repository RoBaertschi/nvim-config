local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

-- Only required if you have packer configured as `opt`
vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
	-- Packer can manage itself
	use("wbthomason/packer.nvim")

	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.4",
		-- or                            , branch = '0.1.x',
		requires = { { "nvim-lua/plenary.nvim" } },
	})

	use({ "rose-pine/neovim", as = "rose-pine" })

	use({ "nvim-treesitter/nvim-treesitter", as = "nvim-treesitter", { run = ":TSUpdate" } })
	use("ThePrimeagen/harpoon")
	use("mbbill/undotree")
	use("tpope/vim-fugitive")
	use("folke/neodev.nvim")
	use("tanvirtin/monokai.nvim")
	use({ "akinsho/toggleterm.nvim", tag = "*" })
	use({
		"nvim-lualine/lualine.nvim",
		requires = { "nvim-tree/nvim-web-devicons", opt = true },
	})
	use({ "nvim-tree/nvim-web-devicons" })

	use({
		"nvim-tree/nvim-tree.lua",
	})

	use({
		"anuvyklack/pretty-fold.nvim",
	})

	use({
		"m4xshen/autoclose.nvim",
	})
	use({
		"startup-nvim/startup.nvim",
		requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
	})
	use({
		"VonHeikemen/lsp-zero.nvim",
		requires = {
			-- LSP Support
			{ "neovim/nvim-lspconfig" },
			{ "williamboman/mason.nvim" },
			{ "williamboman/mason-lspconfig.nvim" },
			-- Autocompletion
			{ "hrsh7th/nvim-cmp" },
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-path" },
			{ "saadparwaiz1/cmp_luasnip" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "hrsh7th/cmp-nvim-lua" },
			-- Snippets
			{ "L3MON4D3/LuaSnip" },
			{ "rafamadriz/friendly-snippets" },
			-- Formatter Support
			{ "nvimtools/none-ls.nvim" },
			{ "jay-babu/mason-null-ls.nvim" },
		},
	})

	use({ "Civitasv/cmake-tools.nvim" })

	use({ "unblevable/quick-scope" })

	use({ os.getenv("HOME") .. "/dev/nvim_plugins/RoPlugin" })
end)
