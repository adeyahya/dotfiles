return {
  -- "xiyaowong/transparent.nvim",
  {
    "2nthony/vitesse.nvim",
    enabled = not vim.g.vscode,
    dependencies = {
      "tjdevries/colorbuddy.nvim",
    },
    priority = 1000,
    config = function()
      require("vitesse").setup({
        transparent_background = true,
        transparent_float_background = true,
      })

      vim.cmd.colorscheme("vitesse")
      require("lualine").setup({
        options = {
          theme = "vitesse",
        },
      })
    end,
  },
}
