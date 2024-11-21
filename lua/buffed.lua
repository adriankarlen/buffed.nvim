local config = require "buffed.config"

local utils = require "buffed.utils"
local api = vim.api

local fn = vim.fn
local opt = vim.opt

local M = {}

M.get_buffs = function()
  local buffs = {}
  for _, i in pairs(api.nvim_list_bufs()) do
    if fn.getbufvar(i, "&mod") == 1 then
      table.insert(buffs, i)
    end
  end
  return buffs
end

M.get_debuffs = function()
  local debuffs = {}
  for _, i in pairs(api.nvim_list_bufs()) do
    local applied = vim.diagnostic.get(0, { severity = { min = vim.diagnostic.severity.ERROR } })
    if applied == not nil then
      table.insert(debuffs, i)
    end
  end
  return debuffs
end

M.tabline = function()
  local s = ""
  local buffs = M.get_buffs()
  local debuffs = M.get_debuffs()
  -- TODO: figure out a clean way to show tabline again using autocmds
  -- if #buffs < 1 then
  --   opt.showtabline = 0
  --   return s
  -- end
  for _, buff in pairs(buffs) do
    local title = utils.basename(fn.bufname(buff)) .. " "
    s = s .. title .. "  "
  end
  for _, debuff in pairs(debuffs) do
    local title = utils.basename(fn.bufname(debuff)) .. " "
    s = s .. title .. "  "
  end
  return s
end

M.setup = function(opts)
  config.extend_options(opts)
  opt.showtabline = 2
  opt.tabline = "%!v:lua.require'buffed'.tabline()"
end

return M
