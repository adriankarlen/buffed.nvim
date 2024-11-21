local options = require("buffed.config").options
local constants = require "buffed.constants"
local api = vim.api
local fn = vim.fn

local M = {}

---returns table of buffer id's that is modified
---@return table<number>
M.buffs = function()
  local buffs = {}
  for _, i in pairs(api.nvim_list_bufs()) do
    if fn.getbufvar(i, "&mod") == 1 then
      table.insert(buffs, i)
    end
  end
  return buffs
end

---returns table of buffer id's that are open and has diagnostic of configured level
---@return table<number>
M.debuffs = function()
  local debuffs = {}
  for _, i in pairs(api.nvim_list_bufs()) do
    local diagnostic = vim.diagnostic.get(i, { severity = { min = constants.severity[options.debuff.severity] } })
    if #diagnostic > 0 then
      table.insert(debuffs, i)
    end
  end
  return debuffs
end

return M
