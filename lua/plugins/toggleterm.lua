-- return {
--   {
--     "akinsho/toggleterm.nvim",
--     version = "*",
--
--     keys = {
--       { [[<C-\>]], "<cmd>ToggleTerm<CR>", desc = "Toggle terminal" },
--     },
--
--     config = function()
--       require("toggleterm").setup {
--         size = 15,
--         open_mapping = [[<C-\>]],
--         hide_numbers = true,
--         shade_terminals = true,
--         start_in_insert = true,
--         insert_mappings = true,
--         terminal_mappings = true,
--         persist_size = true,
--         persist_mode = true,
--         direction = "horizontal",
--         close_on_exit = false,
--       }
--     end,
--   },
-- }
return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",

    keys = {
      { [[<C-\>]], "<cmd>ToggleTerm<CR>", desc = "Toggle terminal" },
    },

    config = function()
      require("toggleterm").setup {
        size = 15,
        hide_numbers = true,
        shade_terminals = true,
        start_in_insert = true,
        insert_mappings = true,
        terminal_mappings = true,
        persist_size = true,
        persist_mode = true,
        direction = "horizontal",
        close_on_exit = false,
      }

      -- Better terminal navigation
      vim.api.nvim_create_autocmd("TermOpen", {
        callback = function()
          local opts = { buffer = 0 }

          -- Exit terminal mode with Esc
          vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], opts)

          -- Open traceback/compiler paths in the editor window
          vim.keymap.set("n", "gf", function()
            local line = vim.fn.getline "."
            local file = line:match [["([^"]+)"]]
            local linenr = line:match "line (%d+)"

            -- fallback for generic paths
            if not file then file = vim.fn.expand "<cfile>" end

            if file then
              -- jump to previous non-terminal window
              vim.cmd "wincmd p"

              -- open file safely
              vim.cmd("edit " .. vim.fn.fnameescape(file))

              -- jump to line number if present
              if linenr then vim.api.nvim_win_set_cursor(0, { tonumber(linenr), 0 }) end
            end
          end, opts)
        end,
      })
    end,
  },
}
