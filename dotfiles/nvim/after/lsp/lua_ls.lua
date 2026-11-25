---@type vim.lsp.Config
return {
	single_file_support = true,
	settings = {
		Lua = {
			workspace = {
				checkThirdParty = false,
				library = { vim.env.VIMRUNTIME },
			},
			hint = { enable = true, setType = false, paramType = true, paramName = "Disable", semicolon = "Disable", arrayIndex = "Disable" },
			doc = { privateName = { "^_" } },
			diagnostics = {
				disable = { "incomplete-signature-doc", "trailing-space" },
				unusedLocalExclude = { "_*" },
			},
		},
	},
}
