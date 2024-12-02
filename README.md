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

### :hammer_and_wrench: Configuration and setup

#### Defaults

```lua
---@class buffed.options
---@field dynamic_tabline boolean: hides tabline when no buffer info available
---@field file_icons boolean
---@field ignore_current boolean: don't show tabline info for current open buffer
---@class buffed.filter
---@field icon string?
---@field hl string?
---@field fun function
---@field filters table<string, buffed.filter>
{
  dynamic_tabline = true,
  file_icons = true,
  ignore_current = true,
  filters = {},
}
```

<details>
<select>Old opinionated defaults converted to new opts structure</select>

```lua
opts = {
  filters = {
    modified = {
      icon = "",
      hl = "DiagnosticWarn",
      fun = function(bufnr)
        return vim.fn.getbufvar(bufnr, "&mod") == 1
      end,
    },
    with_error = {
      icon = "󰈸",
      hl = "DiagnosticError",
      fun = function(bufnr)
        local diagnostic = vim.diagnostic.get(bufnr, { severity = { min = "ERROR" } })
        return #diagnostic > 0
      end,
    },
  },
},
```

</details>

## 🏗️ Api

In addition to the tabline buffed provides some useful functions to help
managing the buffs and debuffs.

The following two functions can be used to integrate the buffs/debuffs you self.

```lua

-- buffed options
{
  filters = {
    modified = {
      name = "modified"
      icon = "",
      hl = "DiagnosticWarn",
      fun = function(bufnr)
        return vim.fn.getbufvar(bufnr, "&mod") == 1
      end,
    },
  }
}

-- example usage as a picker using vim.ui.select
vim.keymap.set("n", "<leader>fb", function()
  vim.ui.select(require("buffed").get("modified"), { prompt = "select modified" }, function(selection)
    vim.cmd.edit(selection)
  end)
end, { desc = "pick modified" })
```

## :telescope: Pickers

### :telescope: Telescope

```lua
  vim.keymap.set("n", "<leader>fb", function() require("buffed.integrations").telescope("modified") end, desc = "telescope - pick modified")
```

### :telescope: fzf-lua

```lua
  vim.keymap.set("n", "<leader>fb", function() require("buffed.integrations").fzf("modified") end, desc = "fzf-lua - pick modified")
```

## :art: Highlights

The plugin uses the default Tabline highlights, and mainly utilizes the bg color
of TabLine, when passing a highlight for an icon, the fg color is extracted and
a new highlight group prefixed with `Buffed` is created that sets the bg color
the bg color of tabline, this is required due to the way neovim handles bg color
fallbacks in winbar, statusline and tablines, where it defaults to `Normal`. If
your tabline bg differs from that, the bg will not match. This issue seems to be
resolved in a [future release of neovim](https://github.com/neovim/neovim/pull/29976)
and remove the need for these shenanigans.

</details>
