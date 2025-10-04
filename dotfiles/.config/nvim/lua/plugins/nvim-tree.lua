-- lua/plugins/nvim-tree.lua
return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,                    -- Load on startup
  dependencies = {
    "nvim-tree/nvim-web-devicons", -- Optional: for file icons
  },
  config = function()
    -- Disable netrw (Neovim's built-in file explorer) to avoid conflicts
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    -- Set up nvim-tree with minimal configuration
    require("nvim-tree").setup({
      -- Automatically close nvim-tree when it's the last window
      auto_reload_on_write = true,

      view = {
        width = 40,
        side = "left",
      },

      renderer = {
        -- Show git status icons
        icons = {
          git_placement = "before",
          show = {
            file = true,
            folder = true,
            folder_arrow = true,
            git = true,
          },
        },
        -- Highlight opened files
        highlight_opened_files = "name",
      },

      -- Automatically open nvim-tree when starting nvim with a directory
      hijack_directories = {
        enable = true,
        auto_open = true,
      },

      -- Git integration
      git = {
        enable = true,
        ignore = false, -- Show files in .gitignore
        timeout = 400,
      },

      -- File filtering
      filters = {
        dotfiles = false,                              -- Show hidden files
        custom = { ".git", "node_modules", ".cache" }, -- Hide these patterns
      },

      -- Actions configuration
      actions = {
        open_file = {
          -- Close nvim-tree when opening a file
          quit_on_open = false,
          -- Resize other windows when nvim-tree opens/closes
          resize_window = true,
        },
      },
    })

    -- Key mappings
    local opts = { noremap = true, silent = true }

    -- Toggle nvim-tree
    opts.desc = "Toggle file explorer"
    vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", opts)

    -- Focus nvim-tree
    opts.desc = "Focus file explorer"
    vim.keymap.set("n", "<leader>o", ":NvimTreeFocus<CR>", opts)

    -- Find current file in nvim-tree
    opts.desc = "Find file in explorer"
    vim.keymap.set("n", "<leader>fx", ":NvimTreeFindFile<CR>", opts)
  end,
}
