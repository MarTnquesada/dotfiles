-- return {
--   "wtfox/jellybeans.nvim",
--   lazy = false,
--   priority = 1000,
--   config = function()
--     require("jellybeans").setup({
--       vim.cmd.colorscheme "jellybeans-light"
--     })
--   end,
-- }
-- return {
--   "catppuccin/nvim",
--   name = "catppuccin",
--   priority = 1000,
--   config = function()
--     require("catppuccin").setup({
--       flavour = "mocha", -- latte, frappe, macchiato, mocha
--       background = {     -- :h background
--         light = "latte",
--         dark = "mocha",
--       },
--       vim.cmd.colorscheme "catppuccin-mocha"
--     })
--   end,
-- }
return {
  'ribru17/bamboo.nvim',
  lazy = false,
  priority = 1000,
  config = function()
    require('bamboo').setup {
      -- optional configuration here
    }
    require('bamboo').load()
  end,
}
