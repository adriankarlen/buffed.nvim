local utils = require "buffed.utils"
local constants = require "buffed.constants"
local status = require "buffed.status"
local options = require("buffed.config").options
local M = {}

---@param bufname string
---@return string
local get_title = function(bufname)
  local filename = utils._basename(bufname)
  return utils._colorize(filename, constants.highlights.TabLine)
end

M.show = function()
  local s = ""
  local buffs = status.named "buff"
  local debuffs = status.named "debuff"

  for _, filename in pairs(buffs) do
    local buff = get_title(filename)
    local buff_icon = utils._colorize(options.buff.icon, constants.highlights.BuffedBuff)
    s = s .. buff .. buff_icon .. utils._spacer(2)
  end

  s = s .. utils._align()

  for _, filename in pairs(debuffs) do
    local debuff = get_title(filename)
    local debuff_icon = utils._colorize(options.debuff.icon, constants.highlights.BuffedDebuff)
    s = s .. debuff .. debuff_icon .. utils._spacer(2)
  end

  s = s .. utils._truncate()
  return s
end

return M
