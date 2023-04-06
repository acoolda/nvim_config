-- 全部自动监听命令
vim.cmd [[
augroup _auto_format
  autocmd!
  autocmd BufWritePre *.go,*.lua :lua vim.lsp.buf.format()
augroup end
]]

-- Remove statusline and tabline when in Alpha
vim.api.nvim_create_autocmd({ "User" }, {
  pattern = { "AlphaReady" },
  callback = function()
    vim.cmd [[
      set showtabline=0 | autocmd BufUnload <buffer> set showtabline=2
      set laststatus=0 | autocmd BufUnload <buffer> set laststatus=3
    ]]
  end,
})
