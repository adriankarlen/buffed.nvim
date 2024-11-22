local M = {}

---@class Buffed.severity
---@field ERROR integer
---@field WARN integer
---@field INFO integer
---@field HINT integer
M.severity = {
  ERROR = vim.diagnostic.severity.ERROR,
  WARN = vim.diagnostic.severity.WARN,
  INFO = vim.diagnostic.severity.INFO,
  HINT = vim.diagnostic.severity.HINT,
}

---@class Buffed.highlights
---@field TabLine string
---@field TabLineFill string
---@field TabLineSel string
---@field BuffedBuff string
---@field BuffedDebuff string
M.highlights = {
  TabLine = "TabLine",
  TabLineFill = "TabLineFill",
  TabLineSel = "TabLineSel",
  BuffedBuff = "BuffedBuff",
  BuffedDebuff = "BuffedDebuff",
}

return M
