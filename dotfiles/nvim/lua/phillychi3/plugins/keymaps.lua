local map = vim.keymap.set
local Snacks = require("snacks")

-- Explorer (replaces oil's `sf`)
map("n", "sf", function()
	Snacks.explorer()
end, { desc = "Toggle file explorer" })

-- LSP
map("n", "gd", function()
	Snacks.picker.lsp_definitions({ jump = { reuse_win = false } })
end, { desc = "LSP Goto Definition" })
map("n", "gD", Snacks.picker.lsp_declarations, { desc = "LSP Goto Declaration" })
map("n", "gy", Snacks.picker.lsp_type_definitions, { desc = "LSP Goto Type Definition" })
map("n", "gr", Snacks.picker.lsp_references, { desc = "LSP References", nowait = true })
map("n", "gI", Snacks.picker.lsp_implementations, { desc = "LSP Implementations" })
map("n", "K", vim.lsp.buf.hover, { desc = "Hover" })
map("n", "gK", vim.lsp.buf.signature_help, { desc = "Signature Help" })
map("i", "<c-k>", vim.lsp.buf.signature_help, { desc = "Signature Help" })
map("n", "<c-j>", function()
	vim.diagnostic.jump({ count = 1, float = true })
end, { desc = "Next diagnostic" })
map({ "n", "x" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Action" })
map("n", "<leader>cr", vim.lsp.buf.rename, { desc = "Rename" })
map("n", "<leader>cR", Snacks.rename.rename_file, { desc = "Rename File" })
map("n", "<leader>cl", Snacks.picker.lsp_config, { desc = "LSP Info" })

-- Picker
map("n", ";f", Snacks.picker.files, { desc = "Find files" })
map("n", ";r", Snacks.picker.grep, { desc = "Live grep" })
map("n", ";;", Snacks.picker.resume, { desc = "Resume picker" })
map("n", "\\\\", Snacks.picker.buffers, { desc = "List buffers" })
map("n", ";e", Snacks.picker.diagnostics, { desc = "Diagnostics" })
map("n", ";c", Snacks.picker.lsp_incoming_calls, { desc = "LSP incoming calls" })
map("n", ";n", Snacks.picker.notifications, { desc = "Notifications" })
map("n", ";t", function()
	Snacks.picker.todo_comments()
end, { desc = "Todo comments" })

-- Git
map("n", ";g", function()
	Snacks.lazygit()
end, { desc = "Lazygit" })
map("n", ";h", Snacks.picker.git_diff, { desc = "Git Diff (Hunks)" })
map("n", "<leader>gb", Snacks.git.blame_line, { desc = "Blame current line" })
map({ "n", "v" }, "<leader>go", Snacks.gitbrowse.open, { desc = "Open in browser" })

-- Word references
map({ "n", "t" }, "]]", function()
	Snacks.words.jump(vim.v.count1)
end, { desc = "Next Reference" })
map({ "n", "t" }, "[[", function()
	Snacks.words.jump(-vim.v.count1)
end, { desc = "Prev Reference" })

-- Trouble
map("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", { desc = "Diagnostics (Trouble)" })
map("n", "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", { desc = "Buffer diagnostics (Trouble)" })
map("n", "<leader>xs", "<cmd>Trouble symbols toggle focus=false<cr>", { desc = "Symbols (Trouble)" })
map("n", "<leader>xq", "<cmd>Trouble qflist toggle<cr>", { desc = "Quickfix (Trouble)" })
map("n", "<leader>xt", "<cmd>Trouble todo toggle<cr>", { desc = "Todos (Trouble)" })

-- Todo comments
map("n", "]t", function()
	require("todo-comments").jump_next()
end, { desc = "Next todo comment" })
map("n", "[t", function()
	require("todo-comments").jump_prev()
end, { desc = "Prev todo comment" })

-- Cheat sheet: searchable list of every keymap
map("n", "<leader>?", function()
	Snacks.picker.keymaps()
end, { desc = "Keymap cheat sheet" })
