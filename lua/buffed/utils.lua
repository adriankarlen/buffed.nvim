local H = {}

---@param s string
---@return string
H._basename = function(s)
  return s:gsub("(.*[/\\])(.*)", "%2") or ""
end

---@param s string
---@param hl string
---@return string
H._colorize = function(s, hl)
  return "%#" .. hl .. "# " .. s
end

---@param n number
---@return string
H._spacer = function(n)
  local spaces = string.rep(" ", n)
  return "%#TabLineSep#" .. spaces
end

---@return string
H._align = function()
  return "%="
end

---@return string
H._truncate = function()
  return "%<"
end

return H
