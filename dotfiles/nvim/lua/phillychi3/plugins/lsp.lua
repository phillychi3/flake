-- All servers are installed through nix (modules/home/neovim.nix)
vim.lsp.config("*", {
	capabilities = require("blink.cmp").get_lsp_capabilities({
		workspace = {
			fileOperations = { didRename = true, willRename = true },
		},
	}),
})

vim.lsp.enable({
	-- Web
	"vtsls",
	"eslint",
	"cssls",
	"html",
	"jsonls",
	"tailwindcss",
	"svelte",
	-- Languages
	"lua_ls",
	"basedpyright",
	"ruff",
	"gopls",
	"rust_analyzer",
	"nixd",
	"bashls",
})
