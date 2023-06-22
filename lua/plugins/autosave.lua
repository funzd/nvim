return {
  {
    "Pocco81/auto-save.nvim",
    name = "auto-save",
    lazy = false,
    config = function()
      require("auto-save").setup({ enabled = true, debounce_delay = 1000 })
    end,
  },
}
