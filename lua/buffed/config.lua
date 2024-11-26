---@private
---@class buffed.config
local M = {}

---@class buffed.options
---@field file_icons boolean
---@field buff Buff
---@field debuff Debuff
M.options = {
  file_icons = true,
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
