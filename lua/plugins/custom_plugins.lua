return {
  -- autosave-> save modifications automatically
  {
    "Pocco81/aaauto-save.nvim",
    name = "auto-save",
    lazy = false,
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
  {
    "AckslD/nvim-gfold.lua",
    config = function()
      require("gfold").setup()
    end,
  },
}
