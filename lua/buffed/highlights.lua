local constants = require "buffed.constants"
local api = vim.api
local fn = vim.fn

---@private
---@class buffed.highlights
local M = {}

---@param group string
---@param attr string
---@return string
M.get_color = function(group, attr)
  return fn.synIDattr(fn.synIDtrans(fn.hlID(group)), attr)
end

---@param bg string
local set_icon_colors = function(bg)
  local icon_colors = {
    [constants.highlights.BuffedMiniIconsAzure] = { fg = M.get_color("MiniIconsAzure", "fg#"), bg = bg },
    [constants.highlights.BuffedMiniIconsBlue] = { fg = M.get_color("MiniIconsBlue", "fg#"), bg = bg },
    [constants.highlights.BuffedMiniIconsCyan] = { fg = M.get_color("MiniIconsCyan", "fg#"), bg = bg },
    [constants.highlights.BuffedMiniIconsGreen] = { fg = M.get_color("MiniIconsGreen", "fg#"), bg = bg },
    [constants.highlights.BuffedMiniIconsGrey] = { fg = M.get_color("MiniIconsGrey", "fg#"), bg = bg },
    [constants.highlights.BuffedMiniIconsOrange] = { fg = M.get_color("MiniIconsOrange", "fg#"), bg = bg },
    [constants.highlights.BuffedMiniIconsPurple] = { fg = M.get_color("MiniIconsPurple", "fg#"), bg = bg },
    [constants.highlights.BuffedMiniIconsRed] = { fg = M.get_color("MiniIconsRed", "fg#"), bg = bg },
    [constants.highlights.BuffedMiniIconsYellow] = { fg = M.get_color("MiniIconsYellow", "fg#"), bg = bg },
  }
  for hl_key, hl_group in pairs(icon_colors) do
    api.nvim_set_hl(0, hl_key, hl_group)
  end
end

---create custom highlight groups
---@return nil
M.create_hl_groups = function()
  local bg = M.get_color("TabLine", "bg#")
  set_icon_colors(bg)
end

return M
