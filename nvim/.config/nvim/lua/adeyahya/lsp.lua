-- Set buffer-local keymaps when an LSP attaches to a buffer
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("ade_lsp_attach", { clear = true }),
  callback = function(ev)
    local opts = { buffer = ev.buf, silent = true, desc = "Go to Definition" }
    -- gd: Go to definition using built-in LSP
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
    vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
    vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, opts)

    -- rename
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

    -- ca: for code action
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, vim.tbl_extend("force", opts, { desc = "Code Action" }))
  end,
})

vim.diagnostic.config({
  virtual_text = true, -- Shows errors inline
  signs = true,        -- Shows signs in gutter
  underline = true,    -- Underlines problematic code
})

vim.lsp.enable("lua_ls")
vim.lsp.enable("ts_ls")
vim.lsp.enable("eslint")
vim.lsp.enable("tailwindcss")
