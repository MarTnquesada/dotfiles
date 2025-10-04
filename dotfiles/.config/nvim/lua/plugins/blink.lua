return {
  "saghen/blink.cmp",
  dependencies = { 'rafamadriz/friendly-snippets' },
  version = '1.*',
  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    signature = { enabled = true },
    keymap = {
      preset = 'default',
      ['<Tab>'] = { 'select_and_accept', 'fallback' },
    },
    completion = {
      documentation = { auto_show = true, auto_show_delay_ms = 500 },
      menu = {
        draw = {
          columns = {
            { "kind_icon",        "label", gap = 1 },
            { "kind",             gap = 1 },
            { "label_description" }
          }
        }
      }
    }
  },
  opts_extend = { "sources.default" },
}
