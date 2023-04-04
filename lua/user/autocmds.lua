-- 全部自动监听命令
vim.cmd [[
augroup _auto_format
  autocmd!
  autocmd BufWritePre *.go,*.lua :lua vim.lsp.buf.format()
augroup end
]]
