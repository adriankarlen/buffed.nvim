local M = {}

---@class buffed.Options
---@field file_icons boolean
---@field buff Buff
---@field debuff Debuff
M.options = {
  file_icons = true,
  ---@class Buff
  ---@field icon string
  buff = {
    icon = "",
  },
  ---@class Debuff
  ---@field icon string
  ---@field severity "ERROR" | "WARN" | "INFO" | "HINT": minimal level required to be marked as debuff 
  debuff = {
    icon = "󰈸",
    severity = "ERROR",
  },
}

---@param opts buffed.Options
function M.extend_options(opts)
  M.options = vim.tbl_deep_extend("force", M.options, opts or {})
end

return M
