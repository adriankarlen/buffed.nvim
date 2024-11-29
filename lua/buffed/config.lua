---@private
---@class buffed.config
local M = {}

---@class buffed.options
---@field dynamic_tabline boolean: hides tabline when no buffer info available
---@field file_icons boolean
---@field ignore_current boolean: don't show tabline info for current open buffer
---@field buff Buff
---@field debuff Debuff
M.options = {
  dynamic_tabline = true,
  file_icons = true,
  ignore_current = true,
  ---@class Buff
  ---@field enabled boolean
  ---@field icon string
  buff = {
    enabled = true,
    icon = "",
  },
  ---@class Debuff
  ---@field enabled boolean
  ---@field icon string
  ---@field severity "ERROR" | "WARN" | "INFO" | "HINT": minimal level required to be marked as debuff
  debuff = {
    enabled = true,
    icon = "󰈸",
    severity = "ERROR",
  },
}

---@param opts buffed.options
function M.extend_options(opts)
  M.options = vim.tbl_deep_extend("force", M.options, opts or {})
end

return M
