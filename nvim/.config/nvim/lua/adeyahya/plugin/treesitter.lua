return {
  {
    "davidmh/mdx.nvim",
    config = true,
    dependencies = { "nvim-treesitter/nvim-treesitter" },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      -- Setup the main treesitter config first.
      require("nvim-treesitter.configs").setup({
        ensure_installed = { "lua", "vim", "markdown", "markdown_inline" },
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = { "markdown", "mdx" },
        },
        indent = { enable = true },
      })

      vim.api.nvim_create_autocmd("FileType", {
        pattern = "mdx",
        callback = function()
          -- 1. Use the correct, updated module name: require("nvim-treesitter")
          local ts = require("nvim-treesitter")

          -- We can directly check and register the parser configuration through the main module.

          -- Check if the markdown parser info is available
          local markdown_info = ts.get_parser_info("markdown")

          if markdown_info and markdown_info.install_info then
            -- 2. Safely define mdx by referencing the markdown parser info
            -- We write to the internal config table accessed via the main module
            ts.get_parser_configs().mdx = {
              install_info = markdown_info.install_info,
              filetype = "markdown", -- Crucial: use the markdown parser
            }
          end

          -- 3. Ensure syntax highlighting is applied
          vim.cmd("TSHighlightEnable")
        end,
      })

      vim.filetype.add({
        extension = {
          mdx = "mdx",
        },
      })
    end,
  },
}
