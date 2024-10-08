return {
  {
    'Mofiqul/dracula.nvim',
    priority = 1000,
    config = function()
      -- vim.cmd [[colorscheme dracula-soft]]
    end
  },
  {
    "miikanissi/modus-themes.nvim",
    priority = 1000,
    config = function()
      require("modus-themes").setup({
        -- Theme comes in two styles `modus_operandi` and `modus_vivendi`
        -- `auto` will automatically set style based on background set with vim.o.background
        style = "modus_operandi",
        variant = "tinted",   -- Theme comes in four variants `default`, `tinted`, `deuteranopia`, and `tritanopia`
        transparent = false,  -- Transparent background (as supported by the terminal)
        dim_inactive = false, -- "non-current" windows are dimmed
        styles = {
          -- Style to be applied to different syntax groups
          -- Value is any valid attr-list value for `:help nvim_set_hl`
          comments = { italic = true },
          keywords = { italic = true },
          functions = {},
          variables = {},
        },
      })
      -- vim.cmd([[colorscheme modus_operandi]])
    end
  },
  {
    "navarasu/onedark.nvim",
    priority = 900,
    config = function()
      require("onedark").setup({
        -- dark,darker,cool,deep,warm warmer
        style = "warm",
      })
      vim.cmd [[colorscheme onedark]]
    end
  },
}
