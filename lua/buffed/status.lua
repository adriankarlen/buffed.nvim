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
    local applied = vim.diagnostic.get(0, { severity = { min = constants.severity[options.debuff.severity] } })
    if applied == not nil then
      table.insert(debuffs, i)
    end
  end
  return debuffs
end

return M
