return {
  -- 1. Formatter Plugin
  "stevearc/conform.nvim",
  lazy = false, -- Load on startup for format-on-save
  cmd = { "ConformInfo", "ConformFormat" },
  -- Ensure you install the formatter via Mason, or globally on your system.
  dependencies = { "williamboman/mason.nvim" },
  config = function()
    local conform = require("conform")

    -- 2. Define formatters and their commands
    conform.setup({
      formatters_by_ft = {
        lua = { "stylua" }, -- We will use 'stylua' for Lua files
        javascript = { "eslint_d", "prettierd", "prettier", stop_after_first = true }, -- Prioritize prettierd if available
        typescript = { "eslint_d", "prettierd", "prettier", stop_after_first = true },
        javascriptreact = { "eslint_d", "prettierd", "prettier", stop_after_first = true },
        typescriptreact = { "eslint_d", "prettierd", "prettier", stop_after_first = true },
      },

      -- 3. Configuration for format on save (Recommended)
      format_on_save = {
        timeout_ms = 2000,
        lsp_fallback = true, -- Use LSP formatters if conform doesn't have one
        async = false,
      },

      -- 4. Set custom options for specific formatters (Optional)
      formatters = {
        stylua = {
          args = { "--indent-type", "Spaces", "--indent-width", "2", "-" },
        },
      },
    })

    -- Keymap to manually format the entire buffer (optional)
    vim.keymap.set({ "n", "v" }, "<leader>fm", function()
      conform.format({ lsp_fallback = true })
    end, { desc = "Format file or visual selection" })
  end,
}
