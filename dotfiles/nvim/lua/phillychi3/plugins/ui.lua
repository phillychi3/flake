require("tokyonight").setup({
	style = "night",
	transparent = true, -- matches ghostty background-opacity
	styles = {
		sidebars = "transparent",
		floats = "transparent",
	},
})
vim.cmd.colorscheme("tokyonight")

require("mini.icons").setup()
require("mini.icons").mock_nvim_web_devicons()

require("snacks").setup({
	indent = { enabled = true },
	scroll = { enabled = false },
	notifier = { enabled = true },
	statuscolumn = { enabled = true },
	words = { enabled = true },
	explorer = { enabled = true },
	lazygit = { enabled = true, configure = true },
	dashboard = {
		enabled = true,
		sections = {
			{ section = "header" },
			{ section = "keys", gap = 1, padding = 1 },
			{ section = "recent_files", icon = " ", title = "Recent Files", indent = 2, padding = 1, limit = 8 },
		},
	},
	picker = {
		enabled = true,
		sources = {
			files = { hidden = true },
			grep = { hidden = true },
			explorer = { hidden = true },
		},
		layouts = {
			default = { layout = { width = 0.9, height = 0.9 } },
		},
	},
})

require("tiny-cmdline").setup({
	position = { y = "20%" },
})

require("lualine").setup({
	options = {
		theme = "auto",
		globalstatus = true,
		disabled_filetypes = { statusline = { "snacks_dashboard" } },
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { "branch" },
		lualine_c = {
			{ "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
			{ "filename", path = 1, symbols = { modified = "", readonly = " 󰌾" } },
		},
		lualine_x = {
			{ "diagnostics" },
			{ "diff" },
		},
		lualine_y = { { "progress", separator = " ", padding = { left = 1, right = 1 } } },
		lualine_z = { { "location", padding = { left = 1, right = 1 } } },
	},
})

require("incline").setup({
	window = {
		margin = { vertical = 0, horizontal = 1 },
		zindex = 10,
	},
	hide = { cursorline = "smart" },
	render = function(props)
		local name = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
		if name == "" then
			name = "[No Name]"
		end
		if vim.bo[props.buf].modified then
			name = "[+] " .. name
		end
		local icon, hl = require("mini.icons").get("file", name)
		return {
			{ icon .. " ", group = hl },
			{ name, gui = vim.bo[props.buf].modified and "bold,italic" or "bold" },
		}
	end,
})

require("trouble").setup({})
