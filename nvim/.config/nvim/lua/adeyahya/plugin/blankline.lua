return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  config = function()
    require("ibl").setup({
      scope = { enabled = false }, -- Only show line guide
      exclude = {
        filetypes = {
          "NvimTree",
          "Trouble",
          "lazy",
          "mason",
          "TelescopePrompt",
          "lspinfo",
        },
      },
    })
  end,
}
