return {
  'folke/todo-comments.nvim',
  event = 'VimEnter',
  dependencies = { 'nvim-lua/plenary.nvim' },
  opts = {
    signs = true,
    gui_style = {
      fg = 'NONE',
      bg = 'BOLD',
    },
    highlight = {
      before = '',
      keyword = 'fg',
      after = 'fg',
    },
    colors = {
      error = { 'DiagnosticError' },
      warning = { 'DiagnosticWarn' },
      info = { 'DiagnosticInfo' },
      hint = { 'DiagnosticHint' },
      default = { 'Identifier' },
      test = { 'Identifier' },
    },
  },
}
