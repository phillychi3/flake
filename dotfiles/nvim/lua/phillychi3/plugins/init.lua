local function gh(x)
	return "https://github.com/" .. x
end

vim.pack.add({
	-- UI
	{ src = gh("folke/tokyonight.nvim") },
	{ src = gh("nvim-mini/mini.icons") },
	{ src = gh("folke/snacks.nvim") },
	{ src = gh("folke/trouble.nvim") },
	{ src = gh("nvim-lualine/lualine.nvim") },
	{ src = gh("b0o/incline.nvim") },
	{ src = gh("rachartier/tiny-cmdline.nvim") },
	-- Editor
	{ src = gh("nvim-treesitter/nvim-treesitter") },
	{ src = gh("mks-h/treesitter-autoinstall.nvim") },
	{ src = gh("nvim-mini/mini.pairs") },
	{ src = gh("saghen/blink.cmp"), version = vim.version.range("^1") },
	{ src = gh("folke/todo-comments.nvim") },
	{ src = gh("nvim-lua/plenary.nvim") }, -- todo-comments dep
	-- LSP
	{ src = gh("neovim/nvim-lspconfig") },
}, { confirm = false })

require("phillychi3.plugins.ui")
require("phillychi3.plugins.treesitter")
require("phillychi3.plugins.editor")
require("phillychi3.plugins.lsp")
require("phillychi3.plugins.keymaps")
