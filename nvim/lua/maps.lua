local function map(lhs, rhs, modes)
	for i = 1, #modes do
		vim.api.nvim_set_keymap(modes:sub(i, i), lhs, rhs, { noremap = true })
	end
end

local function lua_map(lhs, callback, modes)
	for i = 1, #modes do
		vim.api.nvim_set_keymap(modes:sub(i, i), lhs, "", { noremap = true, callback = callback })
	end
end

map("<Up>", "", "i")
map("<Left>", "", "i")
map("<Down>", "", "i")
map("<Right>", "", "i")

map("<C-d>", "<Cmd>BufferClose<CR>", "n")
map("<C-h>", "<Cmd>BufferPrevious<CR>", "n")
map("<C-l>", "<Cmd>BufferNext<CR>", "n")
map("<C-S-h>", "<Cmd>BufferMovePrevious<CR>", "n")
map("<C-S-l>", "<Cmd>BufferMoveNext<CR>", "n")
map("<C-j>", "4<C-e>", "n")
map("<C-k>", "4<C-y>", "n")
map("<Leader>t", "<Cmd>Neotree toggle<CR>", "n")
map("<Leader>c", "<Cmd>ClaudeCode<Cr>", "n")
map("<Leader>w", "<C-w><C-w>", "n")
map("<Space>", "za", "n")
map("<C-h>", "<Left>", "ic")
map("<C-l>", "<Right>", "ic")
map("<C-j>", "<Down>", "ic")
map("<C-k>", "<Up>", "ic")

map("<Esc>", "<C-\\><C-n>", "t")

lua_map("gd", function()
	vim.lsp.buf.definition()
end, "n")
lua_map("<Leader>i", function()
	vim.lsp.buf.hover()
end, "n")
lua_map("<Leader>u", function()
	vim.lsp.buf.references()
end, "n")
lua_map("<Leader>N", function()
  vim.diagnostic.get_prev()
end, "n")
lua_map("<Leader>n", function()
  vim.diagnostic.get_next()
end, "n")
lua_map("<Leader>e", function()
	vim.diagnostic.open_float(nil, { focus = false })
end, "n")
lua_map("<Leader>s", function()
	require("telescope.builtin").find_files()
end, "n")
lua_map("<Leader>ql", function()
	require("persistence").load({ last = true })
end, "n")
lua_map("<Leader>qs", function()
	require("persistence").select()
end, "n")

