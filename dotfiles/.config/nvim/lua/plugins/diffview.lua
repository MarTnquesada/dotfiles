return {
  "sindrets/diffview.nvim",
  cmd = { "DiffviewOpen", "DiffviewFileHistory" },
  keys = {
    { "<leader>gd", "<cmd>DiffviewOpen<cr>",                desc = "DiffviewOpen (diffview)" },
    { "<leader>gD", "<cmd>DiffviewOpen origin/master...HEAD<cr>", desc = "Diff vs master (diffview)" },
    { "<leader>gh", "<cmd>DiffviewFileHistory<cr>",         desc = "DiffviewFileHistory (diffview)" },
  },
  opts = {},
}
