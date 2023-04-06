local configs = require("nvim-treesitter.configs")
configs.setup {
  -- 这里指定安装对应语言的语法高亮
  -- https://github.com/nvim-treesitter/nvim-treesitter 查看支持语言
  -- ensure_installed = {"lua","go","vim","python"},
  -- 全部安装
  ensure_installed = "all",
  sync_install = false,
  ignore_install = { "" },  -- List of parsers to ignore installing
  highlight = {
    enable = true,          -- false will disable the whole extension
    disable = { "" },       -- list of language that will be disabled
    additional_vim_regex_highlighting = true,
  },
  indent = { enable = true, },
  -- 给括号添加不同颜色
  rainbow = {
    enable = true,
    -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
    extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = nil, -- Do not enable for files with more than n lines, int
    -- colors = {}, -- table of hex strings
    -- termcolors = {} -- table of colour name strings
  }
}
