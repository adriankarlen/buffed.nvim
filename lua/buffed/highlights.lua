local constants = require "buffed.constants"
local api = vim.api
local fn = vim.fn

---@private
---@class buffed.highlights
local M = {}

---@param group string
---@param attr string
---@return string
local get_color = function(group, attr)
  return fn.synIDattr(fn.synIDtrans(fn.hlID(group)), attr)
end

---create custom highlight groups
---@param filter_highlights table<string>
---@return nil
M.create_hl_groups = function(filter_highlights)
  local bg = get_color("TabLine", "bg#")
  local highlights = vim.tbl_extend("force", constants.highlights, filter_highlights)
  for _, hl in pairs(highlights) do
    api.nvim_set_hl(0, "Buffed" .. hl, { fg = get_color(hl, "fg#"), bg = bg })
  end
end

return M
