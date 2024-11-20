local config = require "plugin.buffed.config"
local M = {}

M.show = function()
  local s = ""
  s = s .. "This is my bufferline"
  return s
end

M.setup = function(opts)
  config.extend_options(opts)
  vim.opt.tabline = "%v:lua.require'buffed'.show()"
  vim.cmd "set showtabline=3"
end
return M
