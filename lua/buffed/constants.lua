local M = {}

M.severity = {
  ERROR = vim.diagnostic.severity.ERROR,
  WARN = vim.diagnostic.severity.WARN,
  INFO = vim.diagnostic.severity.INFO,
  HINT = vim.diagnostic.severity.HINT,
}

M.highlights = {
  TabLine = "TabLine",
  TabLineFill = "TabLineFill",
  TabLineSel = "TabLineSel",
  BuffedBuff = "BuffedBuff",
  BuffedDebuff = "BuffedDebuff",
}

return M
