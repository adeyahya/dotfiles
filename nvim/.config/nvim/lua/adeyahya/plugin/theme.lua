return {
  {
    "vague-theme/vague.nvim",
    lazy = true, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other plugins
    config = function()
      -- NOTE: you do not need to call setup if you don't want to.
      require("vague").setup({
        -- optional configuration here
        transparent = true,
      })
      -- vim.cmd("colorscheme vague")
    end,
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",

    -- 1. Set a high priority and disable lazy loading.
    --    This ensures the colorscheme loads before other plugins apply their colors.
    lazy = false,
    priority = 1000,

    -- 2. Use the 'config' function to set up and apply the theme
    config = function()
      require("catppuccin").setup({
        -- ** Set the default flavor to Mocha **
        flavour = "mocha",

        -- Other common configurations (optional)
        transparent_background = true, -- Set to true for terminal background passthrough

        -- Automatically enable integrations for many other plugins you have installed
        auto_integrations = true,

        -- You can define which flavor to use for light/dark mode if you toggle them
        background = {
          light = "latte",
          dark = "mocha",
        },

        -- Add any custom style or highlight overrides here
        styles = {
          comments = { "italic" },
        },
      })

      vim.cmd("colorscheme catppuccin")

      -- 3. Apply the colorscheme
      -- vim.cmd.colorscheme("catppuccin")
      -- You can also use "catppuccin-mocha" directly here,
      -- but "catppuccin" is safer as it respects the 'flavour' option above.
    end,
  },
}
