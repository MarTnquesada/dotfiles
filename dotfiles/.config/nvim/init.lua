-- Options (including leader key) should be loaded before lazy.nvim
require("config.options")
require("config.lazy")
require("config.keymaps")

-- Globals sane printing and reloading
_G.P = function(v)
  print(vim.inspect(v))
  return v
end

_G.RELOAD = function(...)
  return require("plenary.reload").reload_module(...)
end

_G.R = function(name)
  RELOAD(name)
  return require(name)
end
