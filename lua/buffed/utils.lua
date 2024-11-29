local fn = vim.fn

---@private
---@class buffed.utils
local H = {}

---get basename for a filepath
---@param s string
---@return string
H._basename = function(s)
  return fn.fnamemodify(s, ":t")
end

---get filepath with cwd as root for a filepath
---@param s string
---@return string
H._cwd_filename = function(s)
  return fn.fnamemodify(s, ":~:.:h") .. "/" .. fn.fnamemodify(s, ":t")
end

---apply hl to a string
---@param s string
---@param hl string
---@return string
H._colorize = function(s, hl)
  return "%#" .. hl .. "# " .. s
end

---add spacing with hl
---@param n number
---@return string
H._spacer = function(n)
  local spaces = string.rep(" ", n)
  return H._colorize(spaces, "TabLineSep")
end

---adds alignment string
---@return string
H._align = function()
  return "%="
end

---truncate end
---@return string
H._truncate = function()
  return "%<"
end

return H
