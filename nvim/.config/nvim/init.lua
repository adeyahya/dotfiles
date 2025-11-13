vim.g.mapleader = " "

require("adeyahya.config.lazy")
require("adeyahya.lsp")

require("notify").setup({
  background_colour = "#000000"
})

vim.g.loaded_netrw = 0
vim.g.loaded_netrwPlugin = 0

vim.opt.number = true -- Show line numbers
vim.opt.relativenumber = true -- Show relative line numbers
vim.opt.tabstop = 4 -- Number of spaces in a tab
vim.opt.shiftwidth = 4 -- Number of spaces to use for each step of (auto)indent
vim.opt.expandtab = true -- Convert tabs to spaces
vim.opt.autoindent = true -- Copy indent from current line when starting a new line

vim.opt.smartindent = true -- Smart auto-indenting
vim.opt.wrap = true -- Enable line wrap
vim.opt.linebreak = true -- Break lines at word boundaries
vim.opt.breakindent = true -- Preserve indentation in wrapped lines
vim.opt.showbreak = "↪ " -- Show character at line breaks (optional)

vim.opt.hlsearch = true -- Highlight all matches on search
vim.opt.incsearch = true -- Incremental search
vim.opt.ignorecase = true -- Ignore case in search
vim.opt.smartcase = true -- Smart case search

vim.opt.swapfile = false -- Don't use swap files
vim.opt.backup = false -- Don't create backup files

vim.opt.splitbelow = true -- Horizontal splits below current window
vim.opt.splitright = true -- Vertical splits right of current window

vim.opt.termguicolors = true -- Enable 24-bit RGB color support

-- toggle relative number
vim.keymap.set("n", "<leader>n", ":set relativenumber!<CR>", { desc = "Toggle relative number" })

-- Tabs & Indentation
vim.opt.tabstop = 2      -- NEW: The width of a <Tab> is 2 spaces.
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2   -- NEW: Indentation amount is 2 spaces.
vim.opt.expandtab = true -- Converts <Tab> key presses to spaces.
vim.opt.autoindent = true
vim.opt.smartindent = true

vim.keymap.set("n", ";;", ":w<CR>", { desc = "Save File" })

vim.filetype.add({
  extension = {
    -- Map the .mdx extension to the filetype 'mdx'
    mdx = "mdx",
  },
})
