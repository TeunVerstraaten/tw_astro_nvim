-- return {
--   "nvim-neo-tree/neo-tree.nvim",
--   branch = "v3.x",
--   dependencies = {
--     "nvim-lua/plenary.nvim",
--     "MunifTanjim/nui.nvim",
--     "nvim-tree/nvim-web-devicons", -- optional but recommended
--   },
--   config = function()
--     require("neo-tree").setup {
--       filesystem = {
--         filtered_items = {
--           visible = true, -- show filtered items (so toggles behave normally)
--           hide_dotfiles = false, -- show .files
--           hide_gitignored = false, -- show gitignored files
--         },
--       },
--     }
--   end,
-- }
return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",

  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "nvim-tree/nvim-web-devicons",
  },

  config = function()
    require("neo-tree").setup {
      sources = {
        "filesystem",
        "buffers",
        "git_status",
      },

      source_selector = {
        winbar = true, -- top bar inside neo-tree
        statusline = false, -- alternatively bottom bar

        sources = {
          { source = "filesystem", display_name = " Files " },
          { source = "buffers", display_name = " Buffers " },
          { source = "git_status", display_name = " Git " },
        },
      },

      filesystem = {
        filtered_items = {
          visible = true,
          hide_dotfiles = false,
          hide_gitignored = false,
        },
      },
    }
  end,
}
