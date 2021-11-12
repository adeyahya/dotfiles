local set = U.set
local highlight = U.highlight

-- Misc
-- disable some health checks
vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_python_provider = 0

-- init autocmd
-- vim.cmd('autocmd!')
-- vim.cmd('scriptencoding utf-8')
-- vim.cmd('if !1 | finish | endif')

-- enable syntax
vim.cmd('syntax enable')
vim.cmd('filetype plugin indent on')

set 'nocompatible'
set 'number'

set('fileencodings', 'utf-8,sjis,euc-jp,latin')
set('encoding', 'utf-8')

set 'title'
set 'autoindent'
set('background', 'dark')
set 'nobackup'
set 'hlsearch'
set 'showcmd'
set('cmdheight', '1')
set('laststatus', '2')
set('scrolloff', '10')
set 'expandtab'

set 'inccommand=split'

-- Suppress appending <PasteStart> and <PasteEnd> when pasting
set 't_BE='

set 'nosc noru nosm'

-- Don't redraw while executing macros (good performance config)
set 'lazyredraw'

-- Ignore case when searching
set 'ignorecase'

set 'smarttab'
set('shiftwidth', 2)
set('tabstop', 2)
set 'ai' -- Auto indent
set 'si' -- Smart indent
set 'nowrap'

-- Finding files - Search down into subfolders
set('path+', '**')
set('wildignore+', '*/node_modules/*')


-- File types
-- Javascript
vim.cmd('au BufNewFile,BufRead *.es6 setf javascript')
-- typescript
vim.cmd('au BufNewFile,BufRead *.tsx setf typescriptreact')
-- Markdown
vim.cmd('au BufNewFile,BufRead *.md set filetype=markdown')
vim.cmd('au BufNewFile,BufRead *.mdx set filetype=markdown')

set('suffixesadd', '.js,.es,.jsx,.json,.css,.less,.sass,.styl,.php,.py,.md')


-- color
set 'termguicolors'
set('winblend', '0') 
set('wildoptions', 'pum')
set('pumblend', '5')

-- Extras
set 'exrc'
set('completeopt', 'menu,menuone,noselect')

vim.g.sonokai_disable_italic_comment = '1'
vim.cmd('colorscheme sonokai')

