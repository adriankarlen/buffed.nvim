# :muscle: `buffed.nvim`

`buffed.nvim` is a neovim tabline plugin that focuses on giving you information
about your open buffers without bloat.

The plugin currently divides open buffers in three groups

1. Buffs - unsaved buffers
2. Debuffs - open buffers with diagnostics of configured level
3. Noice - open buffers that don't say anything of note

The main goal of this plugin is to provide information regarding open buffers in
a minimal way while enforcing a navigational approach to fuzzy find the file you
are looking for. Thus making you loose that nasty buffer cycling habit from VS
Code.

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
  ---@field enabled boolean
  ---@field icon string
  buff = {
    enabled = true,
    icon = "",
  },
  ---@class Debuff
  ---@field enabled boolean
  ---@field icon string
  ---@field severity "ERROR" | "WARN" | "INFO" | "HINT": minimal level required to be marked as debuff
  debuff = {
    enabled = true,
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
