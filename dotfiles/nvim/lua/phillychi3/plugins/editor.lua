require("blink.cmp").setup({
	snippets = { preset = "default" },
	completion = {
		accept = { auto_brackets = { enabled = true } },
		menu = {
			border = "none",
			draw = { treesitter = { "lsp" } },
		},
		documentation = { auto_show = true, auto_show_delay_ms = 200 },
	},
	cmdline = {
		enabled = true,
		keymap = {
			preset = "cmdline",
			["<Right>"] = false,
			["<Left>"] = false,
		},
		completion = {
			list = { selection = { preselect = false } },
			menu = {
				auto_show = function()
					return vim.fn.getcmdtype() == ":"
				end,
			},
			ghost_text = { enabled = true },
		},
	},
	keymap = {
		preset = "enter",
		["<C-y>"] = { "select_and_accept" },
	},
})

require("mini.pairs").setup({
	modes = { insert = true, command = true, terminal = false },
})

require("todo-comments").setup()
