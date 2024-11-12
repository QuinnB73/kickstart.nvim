vim.keymap.set('n', 'gf', function()
  if require('obsidian').util.cursor_on_markdown_link() then
    return '<cmd>ObsidianFollowLink<CR>'
  else
    return 'gf'
  end
end, { noremap = false, expr = true })

return {
  'epwalsh/obsidian.nvim',
  version = '*', -- recommended, use latest release instead of latest commit
  lazy = true,
  -- Only load obsidian.nvim for markdown files in your vault:
  event = {
    -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
    -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
    -- refer to `:h file-pattern` for more examples
    -- "BufReadPre path/to/my-vault/*.md",
    -- "BufNewFile path/to/my-vault/*.md",
    'BufReadPre '
      .. vim.fn.expand '~'
      .. '/notes/dev_notes/obsidian/notes/*.md',
    'BufNewFile ' .. vim.fn.expand '~' .. '/notes/dev_notes/obsidian/notes/*.md',
  },
  dependencies = {
    -- Required.
    'nvim-lua/plenary.nvim',

    -- Optional
    'hrsh7th/nvim-cmp',
    'nvim-telescope/telescope.nvim',
    'nvim-treesitter',
  },
  opts = {
    workspaces = {
      {
        name = 'faire',
        path = '~/notes/dev_notes/obsidian/notes',
      },
    },

    -- Optional, completion of wiki links, local markdown links, and tags using nvim-cmp.
    completion = {
      nvim_cmp = true,
      min_chars = 2,
    },

    mappings = {
      -- Note that the gf mapping is not set here, this is because we do passthrough elsewhere
      -- Toggle check-boxes.
      ['<leader>ch'] = {
        action = function()
          return require('obsidian').util.toggle_checkbox()
        end,
        opts = { buffer = true },
      },
      -- Smart action depending on context, either follow link or toggle checkbox.
      ['<cr>'] = {
        action = function()
          return require('obsidian').util.smart_action()
        end,
        opts = { buffer = true, expr = true },
      },
      ['<leader>,'] = {
        action = '<cmd>ObsidianQuickSwitch<cr>',
        opts = { buffer = true },
      },
      ['<leader>os'] = {
        action = '<cmd>ObsidianSearch<cr>',
        opts = { buffer = true },
      },
      ['<leader>on'] = {
        action = '<cmd>ObsidianNew<cr>',
        opts = { buffer = true },
      },
      ['<leader>ott'] = {
        action = '<cmd>ObsidianTags<cr>',
        opts = { buffer = true },
      },
      ['<leader>oti'] = {
        action = '<cmd>ObsidianTemplate<cr>',
        opts = { buffer = true },
      },
      ['<leader>otc'] = {
        action = '<cmd>ObsidianNewFromTemplate<cr>',
        opts = { buffer = true },
      },
      ['<leader>olb'] = {
        action = '<cmd>ObsidianBacklinks<cr>',
        opts = { buffer = true },
      },
      ['<leader>oll'] = {
        action = '<cmd>ObsidianLinks<cr>',
        opts = { buffer = true },
      },
      ['<leader>ola'] = {
        action = '<cmd>ObsidianLink<cr>',
        opts = { buffer = true },
      },
      ['<leader>olc'] = {
        action = '<cmd>ObsidianLinkNew<cr>',
        opts = { buffer = true },
      },
      ['<leader>ole'] = {
        action = '<cmd>ObsidianExtractNote<cr>',
        opts = { buffer = true },
      },
    },

    notes_subdir = 'Zettelkasten',
    new_notes_location = 'notes_subdir',

    wiki_link_func = 'use_alias_only',
    preferred_link_style = 'wiki',

    follow_img_func = function(img)
      vim.fn.jobstart { 'qlmanage', '-p', img }
    end,

    templates = {
      folder = 'Templates',
      date_format = '%Y-%m-%d',
      time_format = '%H:%M',
      -- A map for custom variables, the key should be the variable and the value a function
      substitutions = {},
    },

    picker = {
      -- Set your preferred picker. Can be one of 'telescope.nvim', 'fzf-lua', or 'mini.pick'.
      name = 'telescope.nvim',
      -- Optional, configure key mappings for the picker. These are the defaults.
      -- Not all pickers support all mappings.
      note_mappings = {
        -- Create a new note from your query.
        new = '<C-x>',
        -- Insert a link to the selected note.
        insert_link = '<C-l>',
      },
      tag_mappings = {
        -- Add tag(s) to current note.
        tag_note = '<C-x>',
        -- Insert a tag at the current location.
        insert_tag = '<C-l>',
      },
    },

    -- Optional, sort search results by "path", "modified", "accessed", or "created".
    -- The recommend value is "modified" and `true` for `sort_reversed`, which means, for example,
    -- that `:ObsidianQuickSwitch` will show the notes sorted by latest modified time
    sort_by = 'modified',
    sort_reversed = true,

    -- Set the maximum number of lines to read from notes on disk when performing certain searches.
    search_max_lines = 1000,

    open_notes_in = 'vsplit',

    attachments = {
      img_folder = 'Attachments',
    },
  },
}
