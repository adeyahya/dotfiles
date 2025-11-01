return {
  -- 1. Formatter Plugin
  "stevearc/conform.nvim",
  lazy = false,   -- Load on startup for format-on-save
  cmd = { "ConformInfo", "ConformFormat" },
  -- Ensure you install the formatter via Mason, or globally on your system.
  dependencies = { "williamboman/mason.nvim" },
  config = function()
    local conform = require("conform")

    -- 2. Define formatters and their commands
    conform.setup({
      formatters_by_ft = {
        lua = { "stylua" },         -- We will use 'stylua' for Lua files
        javascript = { "prettier" },
        typescript = { "prettier" },
        -- Add more filetypes and formatters here
        -- ["*"] = { "codespell" }, -- Example for a general formatter
      },

      -- 3. Configuration for format on save (Recommended)
      format_on_save = {
        timeout_ms = 500,
        lsp_fallback = true,         -- Use LSP formatters if conform doesn't have one
      },

      -- 4. Set custom options for specific formatters (Optional)
      formatters = {
        stylua = {
          -- Example argument: use 4 spaces for indentation
          args = { "--indent-type", "Spaces", "--indent-width", "4", "-" },
        },
      },
    })

    -- Keymap to manually format the entire buffer (optional)
    vim.keymap.set({ "n", "v" }, "<leader>fm", function()
      conform.format({ lsp_fallback = true })
    end, { desc = "Format file or visual selection" })
  end,
}
