-- Auto-center on scroll
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

local function is_user_terminal(buf)
  return vim.bo[buf].buftype == "terminal" and vim.b[buf].user_terminal
end

-- Open a buffer in a centered floating window
local function open_float(buf)
  local usable_lines = vim.o.lines - vim.o.cmdheight
  local width = math.floor(vim.o.columns * 0.85)
  local height = math.floor(usable_lines * 0.85)
  -- border adds 2 to each dimension; account for it when centering
  return vim.api.nvim_open_win(buf, true, {
    relative = "editor",
    width = width,
    height = height,
    col = math.floor((vim.o.columns - width - 2) / 2),
    row = math.floor((usable_lines - height - 2) / 2),
    style = "minimal",
    border = "rounded",
  })
end

-- Smart toggles for terminal (excludes claude-code terminal)
vim.keymap.set("n", "<leader>t", function()
  -- Toggle out if in user terminal
  if is_user_terminal(0) then
    vim.cmd("stopinsert")
    vim.api.nvim_win_close(0, false)
    return
  end
  -- Reopen existing (hidden) user terminal buffer
  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    if vim.api.nvim_buf_is_valid(buf) and is_user_terminal(buf) then
      open_float(buf)
      vim.cmd("startinsert")
      return
    end
  end
  -- Create new terminal
  local buf = vim.api.nvim_create_buf(false, false)
  open_float(buf)
  vim.cmd("term")
  vim.b.user_terminal = true
  vim.keymap.set("n", "<Esc>", function()
    vim.api.nvim_win_close(0, false)
  end, { buffer = true, desc = "Close terminal float" })
  vim.cmd("startinsert")
end, { desc = "Terminal float" })

-- Close float and wipe buffer when user terminal process exits
vim.api.nvim_create_autocmd("TermClose", {
  callback = function(ev)
    -- deleting the buffer auto-closes its floating window
    if vim.api.nvim_buf_is_valid(ev.buf) and vim.b[ev.buf].user_terminal then
      vim.api.nvim_buf_delete(ev.buf, { force = true })
    end
  end,
})

-- Between-splits movement
vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], { silent = true })
for _, key in ipairs({ "h", "j", "k", "l" }) do
  vim.keymap.set("n", "<C-" .. key .. ">", "<C-w>" .. key, { silent = true })
  vim.keymap.set("t", "<C-" .. key .. ">", [[<C-\><C-n><C-w>]] .. key, { silent = true })
end
