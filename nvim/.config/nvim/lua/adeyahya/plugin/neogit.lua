return {
  "NeogitOrg/neogit",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "sindrets/diffview.nvim",
    "nvim-telescope/telescope.nvim",
  },
  keys = {
    { "<leader>gs", "<cmd>Neogit<cr>", desc = "Neogit Status" },
    { "<leader>gc", "<cmd>Neogit commit<cr>", desc = "Neogit Commit" },
    { "<leader>gp", "<cmd>Neogit push<cr>", desc = "Neogit Push" },
    { "<leader>gl", "<cmd>Neogit log<cr>", desc = "Neogit Log" },
  },
  opts = {
    integrations = {
      diffview = true,
      telescope = true,
    },
    disable_signs = false,
    disable_hint = false,
    disable_context_highlighting = false,
    disable_commit_confirmation = false,
    auto_refresh = true,
    disable_insert_on_commit = "auto",

    signs = {
      section = { "", "" },
      item = { "", "" },
      hunk = { "", "" },
    },
  },
}
