return {
  -- Plugin: neoconf.nvim
  "folke/neoconf.nvim",
  cmd = "Neoconf",   -- Command to manage configs
  config = function()
    require("neoconf").setup({})
  end,
}
