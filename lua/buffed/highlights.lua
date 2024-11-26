local constants = require "buffed.constants"
local api = vim.api
local fn = vim.fn

---@private
---@class buffed.highlights
local M = {}

---@param group string
---@param attr string
---@return string
local function get_color(group, attr)
  return fn.synIDattr(fn.synIDtrans(fn.hlID(group)), attr)
end

---@param bg string
local set_icon_colors = function(bg)
  local icon_colors = {
    [constants.highlights.BuffedMiniIconsAzure] = { fg = get_color("MiniIconsAzure", "fg#"), bg = bg },
    [constants.highlights.BuffedMiniIconsBlue] = { fg = get_color("MiniIconsBlue", "fg#"), bg = bg },
    [constants.highlights.BuffedMiniIconsCyan] = { fg = get_color("MiniIconsCyan", "fg#"), bg = bg },
    [constants.highlights.BuffedMiniIconsGreen] = { fg = get_color("MiniIconsGreen", "fg#"), bg = bg },
    [constants.highlights.BuffedMiniIconsGrey] = { fg = get_color("MiniIconsGrey", "fg#"), bg = bg },
    [constants.highlights.BuffedMiniIconsOrange] = { fg = get_color("MiniIconsOrange", "fg#"), bg = bg },
    [constants.highlights.BuffedMiniIconsPurple] = { fg = get_color("MiniIconsPurple", "fg#"), bg = bg },
    [constants.highlights.BuffedMiniIconsRed] = { fg = get_color("MiniIconsRed", "fg#"), bg = bg },
    [constants.highlights.BuffedMiniIconsYellow] = { fg = get_color("MiniIconsYellow", "fg#"), bg = bg },
  }
  for hl_key, hl_group in pairs(icon_colors) do
    api.nvim_set_hl(0, hl_key, hl_group)
  end
end

---create custom highlight groups
---@return nil
M.create_hl_groups = function()
  local bg = get_color("TabLine", "bg#")
  set_icon_colors(bg)
  api.nvim_set_hl(0, constants.highlights.BuffedBuff, { fg = get_color("DiagnosticWarn", "fg#"), bg = bg })
  api.nvim_set_hl(0, constants.highlights.BuffedDebuff, { fg = get_color("DiagnosticError", "fg#"), bg = bg })
end

return M
