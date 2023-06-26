return {
  -- nvim-treesitter -> config
  {
    "nvim-treesitter/nvim-treesitter",
    run = function()
      local ts_update = require("nvim-treesitter.install").update({ with_sync = false })
      ts_update()
    end,
  },
  -- autosave-> save modifications automatically
  {
    "Pocco81/auto-save.nvim",
    name = "auto-save",
    lazy = false,
    config = function()
      require("auto-save").setup({ enabled = true })
    end,
  },
}
