return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("lualine").setup({
      options = {
        icons_enabled = true,
        theme = "auto", -- Uses your current colorscheme theme
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        disabled_filetypes = {},
        always_divide_middle = true,
      },
      sections = {
        -- Show mode, git branch, and file info
        lualine_a = { "mode" },
        lualine_b = { "filename", "branch" },
        -- Show LSP/Treesitter info and line numbers
        lualine_c = { { "filetype", icon_only = true, separator = "" } },
        lualine_x = { "encoding", "fileformat" },
        lualine_y = { "progress" },
        lualine_z = { "location" },
      },
      -- You can add different configs for different modes
      -- inactive_sections = { ... }
    })
  end,
}
