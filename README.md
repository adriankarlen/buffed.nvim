# :muscle: `buffed.nvim`

buffer info you care about

## :package: Installation

### lazy.nvim

```lua
{
  "adriankarlen/buffed.nvim",
  dependencies = { "echasnovski/mini.icons" },
  opts = {}
}
```

### Defaults

```lua
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
    icon = "󰈸",
    severity = "ERROR",
  },
}
```

### :paintbrush: Highlights

<details>
<summary>Click to see all highlight groups</summary>

<!--hl start-->

| Highlight group  | Default           |
| ---------------- | ----------------- |
| **BuffedBuff**   | _DiagnosticWarn_  |
| **BuffedDebuff** | _DiagnosticError_ |

<!-- hl-end -->

</details>
