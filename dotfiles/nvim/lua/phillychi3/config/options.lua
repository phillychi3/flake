-- Leader (must be set before plugins load)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Basic
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.title = true
vim.opt.cursorline = true
vim.opt.wrap = false
vim.opt.scrolloff = 10
vim.opt.sidescrolloff = 8

-- Indentation
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true
vim.opt.smartindent = true

-- Search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Visual
vim.opt.termguicolors = true
vim.opt.signcolumn = "yes"
vim.opt.showmatch = true
vim.opt.matchtime = 2
vim.opt.cmdheight = 0
vim.opt.completeopt = "menuone,noinsert,noselect"
vim.opt.pumheight = 10
vim.opt.pumblend = 10
vim.opt.winborder = "rounded"
vim.opt.laststatus = 3
vim.opt.fillchars:append("diff:╱")

-- Files
vim.opt.writebackup = false
vim.opt.swapfile = false
vim.opt.undofile = true
vim.opt.undodir = vim.fn.expand("~/.cache/nvim/undodir")
vim.opt.updatetime = 300
vim.opt.timeoutlen = 500
vim.opt.ttimeoutlen = 0

-- Behavior
vim.opt.iskeyword:append("-")
vim.opt.path:append("**")
vim.opt.wildignore:append({ "*/node_modules/*", "*.o", "*.obj", "*.pyc", "*.class", "*.jar" })
vim.opt.wildmode = "longest:full,full"
vim.opt.mouse = "a" -- mouse enabled
vim.opt.clipboard:append("unnamedplus")

-- Cursor
vim.opt.guicursor =
	"n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175"

-- Folding (treesitter)
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldlevel = 99

-- Splits
vim.opt.splitbelow = true
vim.opt.splitright = true

-- netrw
vim.g.netrw_keepdir = 0
vim.g.netrw_localcopydircmd = "cp -r"

-- Floating cmdline & messages (nvim 0.12 ui2; required by tiny-cmdline)
require("vim._core.ui2").enable({
	enable = true,
	msg = {
		targets = {
			[""] = "msg",
			empty = "cmd",
			bufwrite = "msg",
			confirm = "cmd",
			emsg = "pager",
			echo = "msg",
			echomsg = "msg",
			echoerr = "pager",
			completion = "cmd",
			list_cmd = "pager",
			lua_error = "pager",
			lua_print = "msg",
			progress = "pager",
			rpc_error = "pager",
			quickfix = "msg",
			search_cmd = "cmd",
			search_count = "cmd",
			shell_cmd = "pager",
			shell_err = "pager",
			shell_out = "pager",
			shell_ret = "msg",
			undo = "msg",
			verbose = "pager",
			wildlist = "cmd",
			wmsg = "msg",
			typed_cmd = "cmd",
		},
		cmd = { height = 0.5 },
		dialog = { height = 0.5 },
		msg = { height = 0.3, timeout = 5000 },
		pager = { height = 0.5 },
	},
})
