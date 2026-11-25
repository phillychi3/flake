local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- Do things without updating the registers
keymap.set("n", "x", '"_x')
keymap.set({ "n", "v" }, "<Leader>p", '"0p')
keymap.set("n", "<Leader>P", '"0P')
keymap.set({ "n", "v" }, "<Leader>c", '"_c')
keymap.set({ "n", "v" }, "<Leader>C", '"_C')
keymap.set({ "n", "v" }, "<Leader>d", '"_d')
keymap.set({ "n", "v" }, "<Leader>D", '"_D')

-- Increment/decrement
keymap.set("n", "+", "<C-a>")
keymap.set("n", "-", "<C-x>")

-- Delete a word backwards
keymap.set("n", "dw", 'vb"_d')

-- Select all
keymap.set("n", "<C-a>", "gg<S-v>G")

-- Disable comment continuation on new line
keymap.set("n", "<Leader>o", "o<Esc>^Da", opts)
keymap.set("n", "<Leader>O", "O<Esc>^Da", opts)

-- Jumplist
keymap.set("n", "<C-m>", "<C-i>", opts)

-- Tabs
keymap.set("n", "te", ":tabedit<CR>")
keymap.set("n", "<tab>", ":tabnext<CR>", opts)
keymap.set("n", "<s-tab>", ":tabprev<CR>", opts)

-- Splits
keymap.set("n", "ss", ":split<Return>", opts)
keymap.set("n", "sv", ":vsplit<Return>", opts)
keymap.set("n", "sh", "<C-w>h")
keymap.set("n", "sk", "<C-w>k")
keymap.set("n", "sj", "<C-w>j")
keymap.set("n", "sl", "<C-w>l")

-- Inlay hints
keymap.set("n", "<leader>i", function()
	vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = 0 }), { bufnr = 0 })
end, { desc = "Toggle inlay hints" })

-- Format (LSP)
keymap.set({ "n", "x" }, "<leader>f", function()
	vim.lsp.buf.format({ async = false, timeout_ms = 3000 })
end, { desc = "Format code" })

-- Swap j and k (noremap, so they don't loop into each other)
vim.keymap.set({ "n", "x", "o" }, "j", "k", { noremap = true, desc = "swapped: j -> k" })
vim.keymap.set({ "n", "x", "o" }, "k", "j", { noremap = true, desc = "swapped: k -> j" })

-- Move lines up/down (VS Code Alt+Up / Alt+Down)
vim.keymap.set("n", "<M-Down>", "<cmd>m .+1<cr>==", { desc = "Move line down" })
vim.keymap.set("n", "<M-Up>", "<cmd>m .-2<cr>==", { desc = "Move line up" })
vim.keymap.set("i", "<M-Down>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move line down" })
vim.keymap.set("i", "<M-Up>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move line up" })
vim.keymap.set("v", "<M-Down>", ":m '>+1<cr>gv=gv", { desc = "Move selection down", silent = true })
vim.keymap.set("v", "<M-Up>", ":m '<-2<cr>gv=gv", { desc = "Move selection up", silent = true })
