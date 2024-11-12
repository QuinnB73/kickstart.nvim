local function map(keys, func, desc)
  vim.keymap.set('n', keys, func, { desc = '[H]arpoon ' .. desc })
end

local function setup()
  local harpoon = require 'harpoon'

  -- WARN: This is required
  harpoon:setup()

  map('<leader>ha', function()
    harpoon:list():add()
  end, 'add to list')

  map('<leader>he', function()
    harpoon.ui:toggle_quick_menu(harpoon:list())
  end, 'toggle ui')

  map('<leader>hh', function()
    harpoon:list():select(1)
  end, 'select item 1')
  map('<leader>hj', function()
    harpoon:list():select(2)
  end, 'select item 2')
  map('<leader>hk', function()
    harpoon:list():select(3)
  end, 'select item 3')
  map('<leader>hl', function()
    harpoon:list():select(4)
  end, 'select item 4')

  map('<leader>hp', function()
    harpoon:list():prev()
  end, 'previous item')
  map('<leader>hn', function()
    harpoon:list():next()
  end, 'next item')
end

return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = { 'nvim-lua/plenary.nvim', 'nvim-telescope/telescope.nvim' },
  init = setup,
}
