-- force tf files to filetype terraform
vim.api.nvim_exec([[
    augroup terraform
      autocmd!
      autocmd BufRead,BufNewFile *.hcl set filetype=hcl
      autocmd BufWritePost *.hcl FormatWrite
    augroup END
  ]], false)
