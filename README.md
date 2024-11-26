# :muscle: `buffed.nvim`

buffer info you care about

## :package: Installation

### :zzz: lazy.nvim

```lua
{
  "adriankarlen/buffed.nvim",
  dependencies = { "echasnovski/mini.icons" },
  opts = {}
}
```

### :hammer_and_wrench: Configuration

<details>
<summary>Defaults</summary>

```lua
---@class buffed.options
---@field file_icons boolean
---@field buff Buff
---@field debuff Debuff
{
  file_icons = true,
  ---@class Buff
  ---@field icon string
  buff = {
    icon = "",
  },
  ---@class Debuff
  ---@field icon string
  ---@field severity "ERROR" | "WARN" | "INFO" | "HINT": minimal level required to be marked as debuff
  debuff = {
    icon = "󰈸",
    severity = "ERROR",
  },
}
```

</details>

### :art: Highlights

<details>
<summary>Highlight groups</summary>

<!--hl start-->

| Highlight group           | Default           |
| ------------------------- | ----------------- |
| **BuffedBuff**            | _DiagnosticWarn_  |
| **BuffedDebuff**          | _DiagnosticError_ |
| **BuffedMiniIconsAzure**  | _MiniIconsAzure_  |
| **BuffedMiniIconsBlue**   | _MiniIconsBlue_   |
| **BuffedMiniIconsCyan**   | _MiniIconsCyan_   |
| **BuffedMiniIconsGreen**  | _MiniIconsGreen_  |
| **BuffedMiniIconsGrey**   | _MiniIconsGrey_   |
| **BuffedMiniIconsOrange** | _MiniIconsOrange_ |
| **BuffedMiniIconsPurple** | _MiniIconsPurple_ |
| **BuffedMiniIconsRed**    | _MiniIconsRed_    |
| **BuffedMiniIconsYellow** | _MiniIconsYellow_ |

<!-- hl-end -->

> [!NOTE]
> All highlights use the bg color of TabLine

</details>
