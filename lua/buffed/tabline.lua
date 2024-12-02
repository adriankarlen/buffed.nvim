local utils = require "buffed.utils"
local constants = require "buffed.constants"
local status = require "buffed.status"
local config = require "buffed.config"

local opt = vim.opt

---@private
---@class buffed.tabline
local M = {}

---get icon string and hl group
---@param filename string
---@return string?
---@return string?
local get_icon = function(filename)
  if not config.options.file_icons then
    return
  end
  local get = function()
    return require("mini.icons").get("file", filename)
  end
  local ok, icon, hl = pcall(get)
  if ok then
    return icon, hl
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
    fileicon = utils._colorize(icon, "Buffed" .. hl) .. utils._spacer(0)
  end
  return fileicon .. utils._colorize(filename, constants.highlights.TabLine)
end

---append tabline with a set of buffers
---@param buffers table<string>
---@param icon string?
---@param hl string?
---@return string
local append = function(buffers, icon, hl)
  local s = ""
  for _, filepath in pairs(buffers) do
    local filename = get_title(filepath)
    local colorized_icon = ""
    if icon then
      colorized_icon = utils._colorize(icon, "Buffed" .. hl or constants.highlights.TabLine)
    end
    s = s .. filename .. colorized_icon .. utils._spacer(2)
  end
  return s
end

---generate the tabline
---@return string
M.show = function()
  local s = ""
  local keys = {}
  for key in pairs(config.options.filters) do
    table.insert(keys, key)
  end

  for i, key in ipairs(keys) do
    local filter = config.options.filters[key]
    local buffers = status.named(filter.fun)
    if #buffers > 0 then
      s = s .. append(buffers, filter.icon, filter.hl)
      if i < #keys then
        s = s .. utils._align()
      end
    end
  end

  if config.options.dynamic_tabline and #s < 1 then
    opt.showtabline = 0
    return ""
  end

  s = s .. utils._truncate()
  return s
end

return M
