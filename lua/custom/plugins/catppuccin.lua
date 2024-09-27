return {
  'catppuccin/nvim',
  name = 'catppuccin',
  lazy = true,
  priority = 1000,
  opts = {
    transparent_background = true,
    integrations = {
      cmp = true,
      gitsigns = true,
      indent_blankline = { enabled = true },
      lsp_trouble = true,
      mason = true,
      markdown = true,
      mini = true,
      native_lsp = {
        enabled = true,
        underlines = {
          errors = { 'undercurl' },
          hints = { 'undercurl' },
          warnings = { 'undercurl' },
          information = { 'undercurl' },
        },
      },
      navic = { enabled = true, custom_bg = 'lualine' },
      neotest = true,
      neotree = true,
      noice = true,
      notify = true,
      semantic_tokens = true,
      telescope = true,
      treesitter = true,
      treesitter_context = true,
      which_key = true,
    },
  },
  init = function()
    vim.cmd.colorscheme 'catppuccin-macchiato'
  end,
}
