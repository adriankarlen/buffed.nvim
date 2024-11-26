local autocmd = vim.api.nvim_create_autocmd

autocmd({ "BufWrite", "BufAdd", "InsertEnter", "InsertLeave" }, {
  callback = function()
    vim.opt.showtabline = 2
  end,
})
