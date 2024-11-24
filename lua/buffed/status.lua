local options = require("buffed.config").options
local utils = require "buffed.utils"
local constants = require "buffed.constants"
local api = vim.api
local fn = vim.fn

local M = {}

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

---get buffer names for either debuffs or buffs
---@param type "buff" | "debuff"
---@return table<string>
M.named = function(type)
  if type == "buff" then
    return named_buffers(M.buffs())
  elseif type == "debuff" then
    return named_buffers(M.debuffs())
  end
  return {}
end
return M
