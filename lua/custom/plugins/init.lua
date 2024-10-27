-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {
    {
      'stevearc/oil.nvim',
      dependencies = { 'nvim-tree/nvim-web-devicons' },
      config = function()
        require('oil').setup {
          columns = { 'icon' },
          keymaps = {
            ['<C-h>'] = false,
            ['<M-h>'] = 'actions.select_split',
          },
          view_options = {
            show_hidden = true,
          },
        }

        vim.keymap.set('n', '-', '<CMD>Oil<CR>', { desc = 'Open parent directory' })
        vim.keymap.set('n', '<space>-', require('oil').toggle_float, { desc = 'Open oil in a floating window' })
      end,
    },
    {
      'karb94/neoscroll.nvim',

      config = function()
        local neoscroll = require 'neoscroll'
        local keymap = {

          ['<C-u>'] = function()
            neoscroll.ctrl_u { duration = 100 }
          end,
          ['<C-d>'] = function()
            neoscroll.ctrl_d { duration = 100 }
          end,
          ['<PageUp>'] = function()
            neoscroll.ctrl_u { duration = 100 }
          end,
          ['<PageDown>'] = function()
            neoscroll.ctrl_d { duration = 100 }
          end,
          ['<C-b>'] = function()
            neoscroll.ctrl_b { duration = 200 }
          end,
          ['<C-f>'] = function()
            neoscroll.ctrl_f { duration = 200 }
          end,
          ['<S-PageUp>'] = function()
            neoscroll.ctrl_b { duration = 200 }
          end,
          ['<S-PageDown>'] = function()
            neoscroll.ctrl_f { duration = 200 }
          end,
          ['<C-y>'] = function()
            neoscroll.scroll(-0.1, { move_cursor = false, duration = 100 })
          end,
          ['<C-e>'] = function()
            neoscroll.scroll(0.1, { move_cursor = false, duration = 100 })
          end,
          ['zt'] = function()
            neoscroll.zt { half_win_duration = 250 }
          end,
          ['zz'] = function()
            neoscroll.zz { half_win_duration = 250 }
          end,
          ['zb'] = function()
            neoscroll.zb { half_win_duration = 250 }
          end,
        }
        local modes = { 'n', 'v', 'x' }
        for key, func in pairs(keymap) do
          vim.keymap.set(modes, key, func)
        end
      end,
    },
    {
      {
        'christoomey/vim-tmux-navigator',
        cmd = {
          'TmuxNavigateLeft',
          'TmuxNavigateDown',
          'TmuxNavigateUp',
          'TmuxNavigateRight',
          'TmuxNavigatePrevious',
        },
        keys = {
          { '<c-h>', '<cmd><C-U>TmuxNavigateLeft<cr>' },
          { '<c-j>', '<cmd><C-U>TmuxNavigateDown<cr>' },
          { '<c-k>', '<cmd><C-U>TmuxNavigateUp<cr>' },
          { '<c-l>', '<cmd><C-U>TmuxNavigateRight<cr>' },
          { '<c-Left>', '<cmd>TmuxNavigateLeft<cr>' },
          { '<c-Down>', '<cmd>TmuxNavigateDown<cr>' },
          { '<c-Up>', '<cmd>TmuxNavigateUp<cr>' },
          { '<c-Right>', '<cmd>TmuxNavigateRight<cr>' },
          { '<c-\\>', '<cmd>TmuxNavigatePrevious<cr>' },
        },
      },
    },
    {
      {
        'supermaven-inc/supermaven-nvim',
        config = function()
          require('supermaven-nvim').setup {
            keymaps = {
              accept_word = '<C-j>',
            },
            disable_keymaps = true,
            disable_inline_completion = true,
          }
        end,
      },
    },
  },
}
