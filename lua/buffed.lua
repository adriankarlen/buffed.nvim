local config = require "buffed.config"
local status = require "buffed.status"
local highlights = require "buffed.highlights"

local opt = vim.opt

---@class buffed
local M = {}


---get files of named filter
---@return table<string>?
M.get = function(name)
  local filter = config.options.filters[name]
  if filter then
    return status.named(filter.fun)
  end
  return nil
end

---@param opts buffed.options
M.setup = function(opts)
  if config.options.dynamic_tabline then
    require "buffed.autocmds"
  end
  config.extend_options(opts)

  local user_defined_hls = {}
  for _, filter in pairs(config.options.filters) do
    table.insert(user_defined_hls, filter.hl)
  end

  highlights.create_hl_groups(user_defined_hls)
  opt.showtabline = 2
  opt.tabline = "%!v:lua.require'buffed.tabline'.show()"
end

return M
