vim.lsp.enable("lua_ls")

-- Set buffer-local keymaps when an LSP attaches to a buffer
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("ade_lsp_attach", { clear = true }),
  callback = function(ev)
    local opts = { buffer = ev.buf, silent = true, desc = "Go to Definition" }
    -- gd: Go to definition using built-in LSP
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)

    -- ca: for code action
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, vim.tbl_extend("force", opts, { desc = "Code Action" }))
  end,
})

vim.lsp.enable("ts_ls")
