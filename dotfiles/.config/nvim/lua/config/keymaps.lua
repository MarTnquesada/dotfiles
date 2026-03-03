-- Auto-center on scroll
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

local function is_user_terminal(buf)
  return vim.bo[buf].buftype == "terminal" and vim.b[buf].user_terminal
end

-- Smart toggles for terminal (excludes claude-code terminal)
vim.keymap.set("n", "<leader>t", function()
  -- Toggle out if in user terminal
  if is_user_terminal(0) then
    vim.cmd("stopinsert | wincmd p")
    return
  end
  -- Find existing user terminal buffer
  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    if vim.api.nvim_buf_is_valid(buf) and is_user_terminal(buf) then
      local win = vim.fn.bufwinid(buf)
      if win ~= -1 then
        vim.api.nvim_set_current_win(win)
      else
        vim.cmd("rightbelow 60vsplit")
        vim.api.nvim_set_current_buf(buf)
      end
      vim.cmd("startinsert")
      return
    end
  end
  -- Create new terminal
  vim.cmd("rightbelow 60vsplit | term")
  vim.b.user_terminal = true
  vim.cmd("startinsert")
end, { desc = "Terminal split" })

-- Terminal navigation
vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], { silent = true })
for _, key in ipairs({ "h", "j", "k", "l" }) do
  vim.keymap.set("t", "<C-" .. key .. ">", [[<C-\><C-n><C-w>]] .. key, { silent = true })
end
