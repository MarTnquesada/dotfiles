-- lua/plugins/treesitter-context.lua
return {
  {
    "nvim-treesitter/nvim-treesitter-context",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    opts = {
      mode = "cursor",
      max_lines = 3,
      line_numbers = true,
      trim_scope = "outer",
      separator = "─",
      zindex = 20,
    },
    keys = {
      {
        "<leader>ut",
        function()
          local tsc = require("treesitter-context")
          if tsc.enabled() then
            tsc.disable()
          else
            tsc.enable()
          end
        end,
        desc = "Toggle Treesitter Context"
      },
      {
        "[c",
        function() require("treesitter-context").go_to_context(vim.v.count1) end,
        desc = "Jump to parent context"
      },
    },
  },
}
