vim.keymap.set("n", "<leader>b",
  function()
    require("comsat").display_bufs()
  end,
  { desc = "Comsat: show buffers" }
)

return {
  {
    "comsat.nvim",
    dir = "/Users/martinquesada/projects/comsat.nvim",
    config = function()
      require("comsat").setup({
        -- defaults
        keymaps = {
          { "<C-0>", "<leader>0" },
          { "<C-1>", "<leader>1" },
          { "<C-2>", "<leader>2" },
          { "<C-3>", "<leader>3" },
          { "<C-4>", "<leader>4" },
          { "<C-5>", "<leader>5" },
          { "<C-6>", "<leader>6" },
          { "<C-7>", "<leader>7" },
          { "<C-8>", "<leader>8" },
          { "<C-9>", "<leader>9" },
        },
      })
    end,
  },
}
