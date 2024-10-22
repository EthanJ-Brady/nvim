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
  },
}
