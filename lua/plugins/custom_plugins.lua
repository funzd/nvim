return {
  {
    "nvim-treesitter/nvim-treesitter",
    config = function()
      require("nvim-treesitter.configs").setup({
        -- one of "all", "maintained" (parsers with maintainers), or a list of languages
        -- ensure_installed = "",
        prefer_git = true,
        highlight = {
          enable = true, -- false will disable the whole extension
          disable = {}, -- list of language that will be disabled
        },

        indent = {
          enable = false,
        },

        rainbow = {
          enable = true,
        },
      })
    end,
  },
  -- autosave-> save modifications automatically
  {
    "Pocco81/auto-save.nvim",
    name = "auto-save",
    config = function()
      require("auto-save").setup({ enabled = true })
    end,
  },
  -- web-dev-icon -> config
  {
    "nvim-tree/nvim-web-devicons",
    dependencies = { "DaikyXendo/nvim-material-icon" },
    config = function()
      require("nvim-web-devicons").setup({
        override = require("nvim-material-icon").get_icons(),
      })
    end,
  },
  --muren-> replacement plugin
  {
    "AckslD/muren.nvim",
    config = true,
  },
  --git-> plugins
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup()
    end,
  },
}
