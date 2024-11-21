local M = {}

---@class buffed.Options
---@field buff Buff
---@field debuff Debuff
M.options = {
  ---@class Buff
  ---@field icon string
  buff = {
    icon = "",
  },
  ---@class Debuff
  ---@field icon string
  ---@field severity string
  debuff = {
    icon = "",
    severity = "ERROR",
  },
}

---@param opts buffed.Options
function M.extend_options(opts)
  M.options = vim.tbl_deep_extend("force", M.options, opts or {})
end

return M
