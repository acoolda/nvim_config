local null_ls_status, null_ls = pcall(require, "null-ls")
if not null_ls_status then
  return
end
-- https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#formatting
local formatting = null_ls.builtins.formatting
--
local diagnostics = null_ls.builtins.diagnostics

local codeaction = null_ls.builtins.code_actions

null_ls.setup({
  debug = false,
  sources = {
    -- go formating
    formatting.goimports.with({ extra_args = { "-srcdir", "$DIRNAME" } }),
    -- go diagnostics
    -- 根据官方参数配置添加了run有问题，去掉就正常了
    diagnostics.golangci_lint,
    -- go code action
    codeaction.gomodifytags,
  }
})
