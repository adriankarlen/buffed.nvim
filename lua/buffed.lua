local config = require "buffed.config"
local utils = require "buffed.utils"
local constants = require "buffed.constants"
local status = require "buffed.status"
local highlights = require "buffed.highlights"

local options = config.options
local fn = vim.fn
local opt = vim.opt

local M = {}

---@param bufname string
---@return string
local get_title = function(bufname)
  local filename = utils._basename(bufname)
  return utils._colorize(filename, constants.highlights.TabLine)
end

---get a table of buffer file names by their ids
---@param buffers table<number>
---@return table<string>
local named_buffers = function(buffers)
  local named = {}
  for _, buffer in ipairs(buffers) do
    local filename = utils._cwd_filename(fn.bufname(buffer))
    table.insert(named, filename)
  end
  return named
end

---get file names for all buffs
---@return table<string>
M.get_buffs = function()
  local buffs = status.buffs()
  return named_buffers(buffs)
end

---get file names for all debuffs
---@return table<string>
M.get_debuffs = function()
  local debuffs = status.debuffs()
  return named_buffers(debuffs)
end

M.tabline = function()
  local s = ""
  local buffs = M.get_buffs()
  local debuffs = M.get_debuffs()

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

---@param opts buffed.Options
M.setup = function(opts)
  config.extend_options(opts)
  highlights.create_hl_groups()
  opt.showtabline = 2
  opt.tabline = "%!v:lua.require'buffed'.tabline()"
end

return M
