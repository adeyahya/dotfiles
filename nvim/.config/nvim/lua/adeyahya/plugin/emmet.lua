return {
  {
    "mattn/emmet-vim",
    init = function()
      vim.g.user_emmet_settings = {
        tsx = { extends = "html" },
        jsx = { extends = "html" },
        html = { extends = "html" },
      }
    end,
  },
  { "windwp/nvim-ts-autotag", config = true },
}
