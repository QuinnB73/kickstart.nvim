-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim
--
return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  cmd = 'Neotree',
  -- Open Neotree on start up when opening a directory in nvim
  init = function()
    local initGroup = vim.api.nvim_create_augroup('NeoTreeInit', { clear = true })
    vim.api.nvim_create_autocmd('BufEnter', {
      group = initGroup,
      callback = function()
        local file = vim.fn.expand '%:p'
        if vim.fn.isdirectory(file) ~= 0 then
          vim.cmd('Neotree current dir=' .. file)
        end

        vim.api.nvim_clear_autocmds { group = initGroup }
      end,
    })
  end,
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
  },
  keys = {
    { '<leader>e', ':Neotree reveal toggle<CR>', desc = 'NeoTree reveal', silent = false },
  },
  opts = {
    filesystem = {
      hijack_netrw_behavior = 'open_current',
      window = {
        mappings = {
          ['\\'] = 'close_window',
          ['q'] = 'none',
        },
      },
    },
  },
}
