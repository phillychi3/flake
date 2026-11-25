local TS = require("nvim-treesitter")

local ensure_installed = {
	"astro", "bash", "c", "cmake", "cpp", "css", "diff", "fish", "gitignore",
	"go", "gomod", "gosum", "graphql", "html", "http", "java", "javascript",
	"jsdoc", "json", "lua", "luadoc", "luap", "markdown", "markdown_inline",
	"nix", "printf", "python", "query", "regex", "rust", "scss", "sql",
	"svelte", "toml", "tsx", "typescript", "vim", "vimdoc", "xml", "yaml",
}

-- tree-sitter CLI comes from nix (home.packages)
if vim.fn.executable("tree-sitter") == 1 then
	TS.install(ensure_installed)
end

require("treesitter-autoinstall").setup()

-- Start highlighting + treesitter indent whenever a parser exists
vim.api.nvim_create_autocmd("FileType", {
	group = vim.api.nvim_create_augroup("TreesitterStart", { clear = true }),
	callback = function(ev)
		local lang = vim.treesitter.language.get_lang(ev.match)
		if not lang or not pcall(vim.treesitter.start, ev.buf, lang) then
			return
		end
		vim.bo[ev.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
	end,
})

-- Keep parsers in sync with the plugin
vim.api.nvim_create_autocmd("PackChanged", {
	callback = function(ev)
		local name, kind = ev.data.spec.name, ev.data.kind
		if name == "nvim-treesitter" and (kind == "install" or kind == "update") then
			vim.cmd("TSUpdate")
		end
	end,
})
