---@private
---@class buffed.config
local M = {}

---@class buffed.options
---@field dynamic_tabline boolean: hides tabline when no buffer info available
---@field file_icons boolean
---@field ignore_current boolean: don't show tabline info for current open buffer
---@class buffed.filter
---@field icon string?
---@field hl string?
---@field fun function
---@field filters table<string, buffed.filter>
M.options = {
  dynamic_tabline = true,
  file_icons = true,
  ignore_current = true,
  filters = {},
}

---@param opts buffed.options
function M.extend_options(opts)
  M.options = vim.tbl_deep_extend("force", M.options, opts or {})
end

return M
