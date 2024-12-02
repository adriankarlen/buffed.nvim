---@class integrations
local M = {}

---opens a fzf-lua picker with buffs
---@param filter string
---@param prompt string?
M.fzf = function(filter, prompt)
  prompt = prompt or "Buffs> "
  require("fzf-lua").fzf_exec(require("buffed").get(filter), {
    prompt = prompt,
    actions = {
      ["default"] = require("fzf-lua").actions.file_edit,
    },
  })
end

---opens a telescope picker with buffs
---@param filter string
---@param opts table?
---@param prompt string?
M.telescope_buff = function(filter, opts, prompt)
  opts = opts or {}
  prompt = prompt or "Buffs"
  require("telescope.pickers")
    .new(opts, {
      prompt_title = prompt,
      finder = require("telescope.finders").new_table(require("buffed").get(filter)),
      sorter = require("telescope.config").generic_sorter(opts),
    })
    :find()
end

return M
