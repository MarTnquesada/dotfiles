-- Auto-center on scroll
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Smart toggles for terminal
vim.keymap.set({ "n", "t" }, "<leader>t", function()
  -- Toggle out of current terminal
  if vim.bo.buftype == "terminal" then
    vim.cmd("stopinsert")
    vim.cmd("wincmd p")
    return
  end
  -- Else, focus on existing terminal
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    local buf = vim.api.nvim_win_get_buf(win)
    if vim.bo[buf].buftype == "terminal" then
      vim.api.nvim_set_current_win(win)
      vim.cmd("startinsert")
      return
    end
  end
  -- Or create one if needed
  vim.cmd("rightbelow vsplit")
  vim.cmd("term")
  vim.cmd("startinsert")
end, { desc = "Terminal split on the right" })

-- Human terminal mappings
local term_opts = { silent = true, desc = "Terminal control" }
vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], term_opts)
vim.keymap.set("t", "<C-h>", [[<C-\><C-n><C-w>h]], term_opts)
vim.keymap.set("t", "<C-j>", [[<C-\><C-n><C-w>j]], term_opts)
vim.keymap.set("t", "<C-k>", [[<C-\><C-n><C-w>k]], term_opts)
vim.keymap.set("t", "<C-l>", [[<C-\><C-n><C-w>l]], term_opts)
