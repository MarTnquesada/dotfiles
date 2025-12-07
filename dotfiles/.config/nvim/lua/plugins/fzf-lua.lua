return {
  "ibhagwan/fzf-lua",
  -- optional for icon support
  dependencies = { "nvim-tree/nvim-web-devicons" },
  -- or if using mini.icons/mini.nvim
  -- dependencies = { "nvim-mini/mini.icons" },
  ---@module "fzf-lua"
  ---@type fzf-lua.Config|{}
  ---@diagnostics disable: missing-fields
  opts = {},
  ---@diagnostics enable: missing-fields
  keys = {
    -- Search
    {
      "<leader>ff",
      function() require("fzf-lua").files() end,
      desc = "Find files (fzf-lua)",
    },
    {
      "<leader>ft",
      function() require("fzf-lua").git_files() end,
      desc = "Find git files (fzf-lua)",
    },
    {
      "<leader>fg",
      function() require("fzf-lua").live_grep() end,
      desc = "Live grep (fzf-lua)",
    },
    {
      "<leader>fb",
      function() require("fzf-lua").buffers() end,
      desc = "Find buffers (fzf-lua)",
    },
    {
      "<leader>fh",
      function() require("fzf-lua").help_tags() end,
      desc = "Help tags (fzf-lua)",
    },

    -- Git
    {
      "<leader>gs",
      function() require("fzf-lua").git_status() end,
      desc = "Git status (fzf-lua)",
    },
    {
      "<leader>gb",
      function() require("fzf-lua").git_branches() end,
      desc = "Git branches (fzf-lua)",
    },

    -- Dap
    {
      "<leader>dapc",
      function() require("fzf-lua").dap_configurations() end,
      desc = "List, run DAP configurations (fzf-lua)",
    },
    {
      "<leader>dapb",
      function() require("fzf-lua").dap_breakpoints() end,
      desc = "List, delete DAP breakpoints (fzf-lua)",
    },
    {
      "<leader>dapv",
      function() require("fzf-lua").dap_variables() end,
      desc = "Active DAP session variables (fzf-lua)",
    },
  }
}
