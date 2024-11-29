---@class integrations
local M = {}

---opens a fzf-lua picker with buffs
---@param prompt string?
M.fzf_buff = function(prompt)
  prompt = prompt or "Buffs> "
  require("fzf-lua").fzf_exec(require("buffed").buffs(), {
    prompt = prompt,
    actions = {
      ['default'] = require'fzf-lua'.actions.file_edit,
    }
  })
end

---opens a fzf-lua picker with debuffs
---@param prompt string?
M.fzf_debuff = function(prompt)
  prompt = prompt or "Debuffs> "
  require("fzf-lua").fzf_exec(require("buffed").debuffs(), {
    prompt = prompt,
    actions = {
      ['default'] = require'fzf-lua'.actions.file_edit,
    }
  })
end

---opens a telescope picker with buffs
---@param opts table
---@param prompt string?
M.telescope_buff = function(opts, prompt)
  opts = opts or {}
  prompt = prompt or "Buffs"
  require("telescope.pickers")
    .new(opts, {
      prompt_title = prompt,
      finder = require("telescope.finders").new_table(require("buffed").buffs()),
      sorter = require("telescope.config").generic_sorter(opts),
    })
    :find()
end

---opens a telescope picker with debuffs
---@param opts table
---@param prompt string?
M.telescope_debuff = function(opts, prompt)
  opts = opts or {}
  prompt = prompt or "Debuffs"
  require("telescope.pickers")
    .new(opts, {
      prompt_title = prompt,
      finder = require("telescope.finders").new_table(require("buffed").debuffs()),
      sorter = require("telescope.config").generic_sorter(opts),
    })
    :find()
end

return M
