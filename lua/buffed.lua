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

M.tabline = function()
  local s = ""
  local buffs = status.buffs()
  local debuffs = status.debuffs()

  for _, buff in pairs(buffs) do
    local buff_title = get_title(fn.bufname(buff))
    local buff_icon = utils._colorize(options.buff.icon, constants.highlights.BuffedBuff)
    s = s .. buff_title .. utils._spacer(1) .. buff_icon .. utils._spacer(2)
  end

  s = s .. utils._align()

  for _, debuff in pairs(debuffs) do
    local debuff_title = get_title(fn.bufname(debuff))
    local debuff_icon = utils._colorize(options.debuff.icon, constants.highlights.BuffedDebuff)
    s = s .. debuff_title .. utils._spacer(1) .. debuff_icon .. utils._spacer(2)
  end
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
