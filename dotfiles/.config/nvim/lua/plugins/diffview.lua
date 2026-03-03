return {
  "sindrets/diffview.nvim",
  cmd = { "DiffviewOpen", "DiffviewFileHistory" },
  keys = {
    { "<leader>gd", "<cmd>DiffviewOpen<cr>",        desc = "DiffviewOpen (diffview)" },
    { "<leader>gh", "<cmd>DiffviewFileHistory<cr>", desc = "DiffviewFileHistory (diffview)" },
  },
  opts = {},
}
