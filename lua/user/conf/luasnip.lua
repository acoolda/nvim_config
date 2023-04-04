local status_ok, ls = pcall(require, "luasnip")
if not status_ok then
  vim.notify("luaSnip not found")
  return
end

ls.setup()

local status_load_ok, ls_lazyload = pcall(require, "luasnip.loaders.from_vscode")
if not status_load_ok then
  return
end

ls_lazyload.lazy_load()
