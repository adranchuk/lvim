local kind = require("adranchuk.kind")

lvim.leader = "space"
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.keys.normal_mode["<S-l>"] = ":BufferLineCycleNext<CR>"
lvim.keys.normal_mode["<S-h>"] = ":BufferLineCyclePrev<CR>"

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<leader>ff", vim.lsp.buf.format)

lvim.keys.normal_mode["|"] = ":vsplit<CR>"

lvim.lsp.buffer_mappings.normal_mode["gr"] = {
	":lua require'telescope.builtin'.lsp_references()<cr>",
	kind.cmp_kind.Reference .. " Find references",
}

lvim.lsp.buffer_mappings.normal_mode["gd"] = {
	":lua vim.lsp.buf.definition()<cr>",
	-- ":lua require'telescope.builtin'.lsp_definitions()<cr>",
	kind.cmp_kind.Reference .. " Definitions",
}

lvim.lsp.buffer_mappings.normal_mode["gD"] = {
	":lua vim.lsp.buf.type_definition()<cr>",
	kind.cmp_kind.Reference .. " Type Definition",
}

lvim.lsp.buffer_mappings.normal_mode["gf"] = {
	":Telescope frecency<cr>",
	kind.cmp_kind.Reference .. " Telescope Frecency",
}

local existingLspWhichKeys = lvim.builtin.which_key.mappings["l"]
table.insert(existingLspWhichKeys, {
	name = "Inlay Hints",
	h = { "<cmd>lua require('lsp-inlayhints').toggle()<cr>", "Toggle Hints" },
})
