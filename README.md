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

## :movie_camera: Demo

https://github.com/user-attachments/assets/bd2109bb-5834-40f7-8029-d38a98db88a6

## :package: Installation

### :zzz: lazy.nvim

```lua
{
  "adriankarlen/buffed.nvim",
  dependencies = { "echasnovski/mini.icons" }, -- optional: required for file icons
  opts = {}
}
```

### :hammer_and_wrench: Configuration

<details>
<summary>Defaults</summary>

```lua
---@class buffed.options
---@field dynamic_tabline boolean: hides tabline when no buffer info available
---@field file_icons boolean
---@field ignore_current boolean: don't show tabline info for current open buffer
---@field buff Buff
---@field debuff Debuff
M.options = {
  dynamic_tabline = true,
  file_icons = true,
  ignore_current = true,
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

## 🏗️ Api

In addition to the tabline buffed provides some useful functions to help
managing the buffs and debuffs.

The following two functions can be used to integrate the buffs/debuffs you self.

```lua
---returns a table of paths to the buffs
require("buffed").buffs()

---returns a table of paths to the debuffs
require("buffed").debuffs()

-- example usage as a picker using vim.ui.select
vim.keymap.set("n", "<leader>fb", function()
  vim.ui.select(require("buffed").buffs(), { prompt = "select buff" }, function(selection)
    vim.cmd.edit(selection)
  end)
end, { desc = "pick buffs" })
```

## :telescope: Pickers

### :telescope: Telescope

```lua
  vim.keymap.set("n", "<leader>fb", function() require("buffed.integrations").telescope_buff() end, desc = "telescope - pick buffs")
  vim.keymap.set("n", "<leader>fd", function() require("buffed.integrations").telescope_debuff() end, desc = "telescope - pick debuffs")
```

### :telescope: fzf-lua

```lua
  vim.keymap.set("n", "<leader>fb", function() require("buffed.integrations").fzf_buff() end, desc = "fzf-lua - pick buffs")
  vim.keymap.set("n", "<leader>fd", function() require("buffed.integrations").fzf_debuff() end, desc = "fzf-lua - pick debuffs")
```

## :art: Highlights

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
