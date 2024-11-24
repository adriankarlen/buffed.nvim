local config = require "buffed.config"
local status = require "buffed.status"
local highlights = require "buffed.highlights"

local opt = vim.opt

local M = {}

---get file names for all buffs
---@return table<string>
M.get_buffs = function()
  return status.named "buff"
end

---get file names for all debuffs
---@return table<string>
M.get_debuffs = function()
  return status.named "debuff"
end

---@param opts buffed.Options
M.setup = function(opts)
  config.extend_options(opts)
  highlights.create_hl_groups()
  opt.showtabline = 2
  opt.tabline = "%!v:lua.require'buffed.tabline'.show()"
end

return M
