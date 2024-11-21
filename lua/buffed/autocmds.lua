local autocmd = vim.api.nvim_create_autocmd

autocmd({ "VimEnter", "BufAdd" }, {
  callback = function()
    require("cokeline.augroups").toggle()
  end,
})
