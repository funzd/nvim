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
    lazy = false,
    config = function()
      require("auto-save").setup({ enabled = true })
    end,
  },
  -- web-dev-icon -> config
  {
    "nvim-tree/nvim-web-devicons",
    opt = true,
    dependencies = {
      "DaikyXendo/nvim-material-icon",
      config = function()
        require("nvim-web-devicons").setup({
          override = require("nvim-material-icon").get_icons(),
        })
      end,
    },
  },
  --git-> plugins
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup()
    end,
  },
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.2",
    dependencies = { "nvim-lua/plenary.nvim" },
    setup = require("telescope").setup({
      defaults = {
        preview = {
          mime_hook = function(filepath, bufnr, opts)
            local is_image = function(filepath)
              local image_extensions = { "png", "jpg", "jpeg", "gif" } -- Supported image formats
              local split_path = vim.split(filepath:lower(), ".", { plain = true })
              local extension = split_path[#split_path]
              return vim.tbl_contains(image_extensions, extension)
            end
            if is_image(filepath) then
              local term = vim.api.nvim_open_term(bufnr, {})
              local function send_output(_, data, _)
                for _, d in ipairs(data) do
                  vim.api.nvim_chan_send(term, d .. "\r\n")
                end
              end
              vim.fn.jobstart({
                "viu",
                "-w",
                "40",
                "-b",
                filepath,
              }, {
                on_stdout = send_output,
                stdout_buffered = true,
              })
            else
              require("telescope.previewers.utils").set_preview_message(bufnr, opts.winid, "Binary cannot be previewed")
            end
          end,
        },
      },
      extensions = {
        media_files = {
          -- filetypes whitelist
          -- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
          filetypes = { "png", "webp", "jpg", "jpeg", "gif" },
          -- find command (defaults to `fd`)
          find_cmd = "rg",
        },
        arecibo = {
          ["selected_engine"] = "google",
          ["url_open_command"] = "xdg-open",
          ["show_http_headers"] = false,
          ["show_domain_icons"] = false,
        },
      },
    }),
  },
  -- add telescope-media-files
  {
    "telescope.nvim",
    dependencies = {
      "nvim-telescope/telescope-media-files.nvim",
      config = function()
        require("telescope").extensions.media_files.media_files()
      end,
    },
  },
  -- {
  --   "telescope.nvim",
  --   dependencies = {
  --     "nvim-telescope/telescope-arecibo.nvim",
  --     build = "make",
  --     rocks = { "openssl", "lua-http-parser" },
  --     config = function()
  --       require("telescope").load_extension("arecibo")
  --     end,
  --   },
  -- },
}
