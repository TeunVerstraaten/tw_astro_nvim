vim.keymap.set("t", "<esc><esc>", function()
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-\\><C-n>", true, false, true), "n", false)
  vim.cmd "HideBottomTerminal"
end, { desc = "Exit terminal + hide bottom terminal" })

local state = {
  b_term = {
    buf = -1,
    win = -1,
  },
}

local function create_bottom_window(opts)
  opts = opts or {}
  local height = opts.height or math.floor(vim.o.lines * 0.3)

  local buf
  if vim.api.nvim_buf_is_valid(opts.buf) then
    buf = opts.buf
  else
    buf = vim.api.nvim_create_buf(false, true)
  end

  -- Create bottom split
  vim.cmd "botright split"
  vim.cmd("resize " .. height)

  local win = vim.api.nvim_get_current_win()
  vim.api.nvim_win_set_buf(win, buf)

  return { buf = buf, win = win }
end
local show_terminal = function()
  if not vim.api.nvim_win_is_valid(state.b_term.win) then
    state.b_term = create_bottom_window { buf = state.b_term.buf }
    if vim.bo[state.b_term.buf].buftype ~= "terminal" then vim.cmd.terminal() end

    vim.schedule(function() vim.cmd "startinsert" end)
  else
    vim.api.nvim_set_current_win(state.b_term.win)

    vim.schedule(function() vim.cmd "startinsert" end)
  end
end
local hide_terminal = function()
  if vim.api.nvim_win_is_valid(state.b_term.win) then
    vim.api.nvim_win_hide(state.b_term.win)
    state.b_term.win = -1
  end
end

vim.api.nvim_create_user_command("ShowBottomTerminal", show_terminal, {})
vim.api.nvim_create_user_command("HideBottomTerminal", hide_terminal, {})

vim.keymap.set("n", "<C-\\>", function() vim.cmd "ShowBottomTerminal" end, { desc = "Show bottom terminal" })
vim.keymap.set("n", "<esc><esc>", function() vim.cmd "HideBottomTerminal" end, { desc = "Hide bottom terminal" })

return {}
