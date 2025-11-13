return {
  {
    "NvChad/nvim-colorizer.lua",
    opts = {
      user_default_options = {
        names = false,
        tailwind = true,
      },
    },
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {
      indent = {
        char = "│", -- or "▏" if you prefer thinner
        highlight = {
          "IblIndent1", "IblIndent2", "IblIndent3",
          "IblIndent4", "IblIndent5", "IblIndent6",
        },
      },
      scope = {
        enabled = true,
        show_start = false,
        show_end = false,
        highlight = "IblScope",
      },
    },
    config = function(_, opts)
      -- 🩶 Transparent-safe ultra-muted tones
      local vague = {
        gray1 = "#2a2d37",
        gray2 = "#303441",
        gray3 = "#353a47",
        gray4 = "#3b404e",
        gray5 = "#404556",
        gray6 = "#454b5f",
        accent = "#C08080", -- slightly brighter scope line
      }
      -- Define highlights BEFORE setup
      vim.api.nvim_set_hl(0, "IblIndent1", { fg = vague.gray1 })
      vim.api.nvim_set_hl(0, "IblIndent2", { fg = vague.gray2 })
      vim.api.nvim_set_hl(0, "IblIndent3", { fg = vague.gray3 })
      vim.api.nvim_set_hl(0, "IblIndent4", { fg = vague.gray4 })
      vim.api.nvim_set_hl(0, "IblIndent5", { fg = vague.gray5 })
      vim.api.nvim_set_hl(0, "IblIndent6", { fg = vague.gray6 })

      -- Highlight active indent (scope)
      vim.api.nvim_set_hl(0, "IblScope", { fg = vague.accent })

      require("ibl").setup(opts)
    end,
  },

  {
    "HiPhish/rainbow-delimiters.nvim",
    config = function()
      -- Vague-inspired muted gray palette
      local vague = {
        gray1 = "#585b70",
        gray2 = "#6c7086",
        gray3 = "#7f849c",
        gray4 = "#9399b2",
        gray5 = "#a6adc8",
        gray6 = "#C08080",
      }

      -- Define soft gradient highlights
      vim.api.nvim_set_hl(0, "RainbowDelimiterGray1", { fg = vague.gray1 })
      vim.api.nvim_set_hl(0, "RainbowDelimiterGray2", { fg = vague.gray2 })
      vim.api.nvim_set_hl(0, "RainbowDelimiterGray3", { fg = vague.gray3 })
      vim.api.nvim_set_hl(0, "RainbowDelimiterGray4", { fg = vague.gray4 })
      vim.api.nvim_set_hl(0, "RainbowDelimiterGray5", { fg = vague.gray5 })
      vim.api.nvim_set_hl(0, "RainbowDelimiterGray6", { fg = vague.gray6 })

      local rainbow_delimiters = require("rainbow-delimiters")

      vim.g.rainbow_delimiters = {
        strategy = {
          [""] = rainbow_delimiters.strategy["global"],
          vim = rainbow_delimiters.strategy["local"],
        },
        query = {
          [""] = "rainbow-delimiters",
          lua = "rainbow-blocks",
        },
        highlight = {
          "RainbowDelimiterGray1",
          "RainbowDelimiterGray2",
          "RainbowDelimiterGray3",
          "RainbowDelimiterGray4",
          "RainbowDelimiterGray5",
          "RainbowDelimiterGray6",
        },
      }
    end,
  }
}
