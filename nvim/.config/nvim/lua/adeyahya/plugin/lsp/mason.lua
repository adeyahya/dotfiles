return {
  {
    "mason-org/mason.nvim",
    opts = {
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗"
        }
      }
    }
  },
  {
    "mason-org/mason-lspconfig.nvim",
    setup = function()
      require('mason-lspconfig').setup({
        -- ADD 'eslint_lsp' here
        ensure_installed = { 'lua_ls', 'html', 'cssls', 'tsserver', 'eslint_lsp' },
      })
    end
  }
}
