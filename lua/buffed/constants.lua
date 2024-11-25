---@class buffed.constants
local M = {}

---@class buffed.severity
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

---@class buffed.highlights
---@field TabLine string
---@field TabLineFill string
---@field TabLineSel string
---@field BuffedBuff string
---@field BuffedDebuff string
---@field BuffedMiniIconsAzure string
---@field BuffedMiniIconsBlue string
---@field BuffedMiniIconsCyan string
---@field BuffedMiniIconsGreen string
---@field BuffedMiniIconsGrey string
---@field BuffedMiniIconsOrange string
---@field BuffedMiniIconsPurple string
---@field BuffedMiniIconsRed string
---@field BuffedMiniIconsYellow string
M.highlights = {
  TabLine = "TabLine",
  TabLineFill = "TabLineFill",
  TabLineSel = "TabLineSel",
  BuffedBuff = "BuffedBuff",
  BuffedDebuff = "BuffedDebuff",
  BuffedMiniIconsAzure = "BuffedMiniIconsAzure",
  BuffedMiniIconsBlue = "BuffedMiniIconsBlue",
  BuffedMiniIconsCyan = "BuffedMiniIconsCyan",
  BuffedMiniIconsGreen = "BuffedMiniIconsGreen",
  BuffedMiniIconsGrey = "BuffedMiniIconsGrey",
  BuffedMiniIconsOrange = "BuffedMiniIconsOrange",
  BuffedMiniIconsPurple = "BuffedMiniIconsPurple",
  BuffedMiniIconsRed = "BuffedMiniIconsRed",
  BuffedMiniIconsYellow = "BuffedMiniIconsYellow",
}

return M
