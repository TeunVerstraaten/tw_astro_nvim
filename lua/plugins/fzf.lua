return {
  {
    "ibhagwan/fzf-lua",
    dependencies = {
      "nvim-tree/nvim-web-devicons", -- optional icons
    },

    config = function()
      local fzf = require "fzf-lua"

      fzf.setup {
        winopts = {
          height = 0.85,
          width = 0.80,
          preview = {
            layout = "vertical", -- preview on the right
            vertical = "up:60%",
            hidden = false,
          },
        },
        keymap = {
          builtin = {
            ["<C-d>"] = "preview-page-down",
            ["<C-u>"] = "preview-page-up",
          },
        },
      }

      vim.keymap.set("n", "<leader>r", function() fzf.lsp_references() end, { desc = "LSP References (fzf-lua)" })
      vim.keymap.set("n", "<leader>ff", function() fzf.files() end, { desc = "Find Files" })
      vim.keymap.set("n", "<leader>fg", function() fzf.live_grep() end, { desc = "Live Grep" })
      vim.keymap.set("n", "<leader>fb", function() fzf.buffers() end, { desc = "Buffers" })
    end,
  },
}
