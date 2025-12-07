return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  config = function()
    require("catppuccin").setup({
      flavour = "mocha", -- latte, frappe, macchiato, mocha
      background = {     -- :h background
        light = "latte",
        dark = "mocha",
      },
      vim.cmd.colorscheme "catppuccin-mocha"
    })
  end,
}
--return {
--  "rose-pine/neovim",
--  name = "rose-pine",
--  config = function()
--    vim.cmd("colorscheme rose-pine-dawn")
--  end
--}
--return {
--  'ribru17/bamboo.nvim',
--  lazy = false,
--  priority = 1000,
--  config = function()
--    require('bamboo').setup {
--      -- optional configuration here
--    }
--    require('bamboo').load()
--  end,
--}
