local config = require("buffed.config")
local utils = require "buffed.utils"
local api = vim.api
local fn = vim.fn

---@private
---@class buffed.status
local M = {}

---get all loaded buffers excluding the currenlty open one
---@return table<number>
local get_buffers = function()
  local current_buf = api.nvim_get_current_buf()
  return vim.tbl_filter(function(bufnr)
    return api.nvim_buf_is_loaded(bufnr) and (not config.options.ignore_current or bufnr ~= current_buf)
  end, api.nvim_list_bufs())
end

---apply a filter to the buffers
---@param filter_callback function
---@return table<number>
local filter = function(filter_callback)
  return vim.tbl_filter(function(bufnr)
    return filter_callback(bufnr)
  end, get_buffers())
end

---get a table of buffer file names by their ids
---@param buffers table<number>
---@return table<string>
local named_buffers = function(buffers)
  local named = {}
  for _, buffer in ipairs(buffers) do
    local path = fn.bufname(buffer)
    local filename = "[No Name]"
    if #path > 0 then
      filename = utils._cwd_filename(path)
    end
    table.insert(named, filename)
  end
  return named
end

---get buffer names for specified filter callback
---@param callback function
---@return table<string>
M.named = function(callback)
    return named_buffers(filter(callback))
end
return M
