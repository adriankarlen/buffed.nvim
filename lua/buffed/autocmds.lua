local autocmd = vim.api.nvim_create_autocmd

autocmd({ "BufWrite", "BufAdd", "InsertCharPre", "InsertEnter","InsertLeave", "DiagnosticChanged" }, {
  callback = function()
    vim.opt.showtabline = 2
  end,
})
