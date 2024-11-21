local constants = require "buffed.constants"
local api = vim.api
local H = {}

H.create_hl_groups = function()
  api.nvim_set_hl(0, constants.highlights.BuffedBuff, { link = "DiagnosticWarn" })
  api.nvim_set_hl(0, constants.highlights.BuffedDebuff, { link = "DiagnosticError" })
end

return H
