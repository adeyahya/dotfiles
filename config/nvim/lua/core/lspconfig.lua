local nvim_lsp = require('lspconfig')
local protocol = require('vim.lsp.protocol')

local on_attach = function(client, bufnr)
	local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
	local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

	-- Mappings.
	local opts = { noremap = true, silent = true }

	buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gp', '<Cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
end

nvim_lsp.tsserver.setup {
	on_attach = on_attach,
	flags = {
		debounce_text_changes = 150,
	},
	filetypes = { "typescript", "typescriptreact", "typescript.tsx" }
}
