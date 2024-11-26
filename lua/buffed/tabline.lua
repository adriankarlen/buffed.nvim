local utils = require "buffed.utils"
local constants = require "buffed.constants"
local status = require "buffed.status"
local options = require("buffed.config").options

---@private
---@class buffed.tabline
local M = {}

---get icon string and hl group
---@param filename string
---@return string?
---@return string?
local get_icon = function(filename)
  if not options.file_icons then
    return
  end
  local get = function()
    return require("mini.icons").get("file", filename)
  end
  local ok, icon, hl = pcall(get)
  if ok then
    return icon, "Buffed" .. hl
  end
end

---get buffer title
---@param bufname string
---@return string
local get_title = function(bufname)
  local filename = utils._basename(bufname)
  local icon, hl = get_icon(filename)
  local fileicon = ""
  if icon and hl then
    fileicon = utils._colorize(icon, hl) .. utils._spacer(0)
  end
  return fileicon .. utils._colorize(filename, constants.highlights.TabLine)
end

---generate the tabline
---@return string
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
