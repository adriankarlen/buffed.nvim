local autocmd = vim.api.nvim_create_autocmd

autocmd({ "BufEnter" }, {
  callback = function()
    vim.opt.showtabline = 2
  end,
})
