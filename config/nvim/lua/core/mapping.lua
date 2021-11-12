local map = U.keymap.map
local nmap = U.keymap.nmap
local imap = U.keymap.imap
local vmap = U.keymap.vmap
local xmap = U.keymap.xmap
local omap = U.keymap.omap
local tmap = U.keymap.tmap
local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

local opts = { noremap = true, silent = true }

-- lsp
buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
buf_set_keymap('n', 'gp', '<Cmd>lua vim.lsp.buf.signature_help()<CR>', opts)

-- Update
nmap(';;', ':update<CR>')
nmap('pp', ':Prettier<CR>')
map('ee', ':NvimTreeToggle<CR>')
nmap('<leader>ff', '<cmd>lua require("telescope.builtin").find_files()<CR>')
nmap('<leader>fg', '<cmd>lua require("telescope.builtin").live_grep()<CR>')
nmap('<leader>fb', '<cmd>lua require("telescope.builtin").buffers()<CR>')
nmap('<leader>fh', '<cmd>lua require("telescope.builtin").help_tags()<CR>')
