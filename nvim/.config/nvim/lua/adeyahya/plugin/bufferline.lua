-- Navigate to the previous buffer
vim.keymap.set("n", "<S-h>", "<Cmd>BufferLineCyclePrev<CR>", { desc = "Go to Previous Buffer" })

-- Navigate to the next buffer
vim.keymap.set("n", "<S-l>", "<Cmd>BufferLineCycleNext<CR>", { desc = "Go to Next Buffer" })

return {
  "akinsho/bufferline.nvim",
  dependencies = "nvim-tree/nvim-web-devicons",
  config = function()
    local bufferline = require("bufferline")
    local mocha = require("catppuccin.palettes").get_palette("mocha")
    bufferline.setup({
      highlights = require("catppuccin.special.bufferline").get_theme({
        styles = { "italic", "bold" },
        custom = {
          all = {
            -- fill = { bg = "#000000" },
          },
          mocha = {
            -- background = { fg = mocha.text },
          },
          latte = {
            -- background = { fg = "#000000" },
          },
        },
      }),
    })
  end,
}
