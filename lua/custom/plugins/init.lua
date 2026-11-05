-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {
    'windwp/nvim-ts-autotag',
    config = function()
      require('nvim-ts-autotag').setup {
        opts = {
          enable_close = true,
          enable_rename = true,
          enable_close_on_slash = false,
        },
        per_filetype = {
          ['html'] = {
            enable_close = true,
          },
        },
      }
    end,
  },

  {
    'fedepujol/move.nvim',
    keys = {
      -- Normal Mode
      { '<A-j>', ':MoveLine(1)<CR>', desc = 'Move Line Up' },
      { '<A-k>', ':MoveLine(-1)<CR>', desc = 'Move Line Down' },
      { '<A-h>', ':MoveHChar(-1)<CR>', desc = 'Move Character Left' },
      { '<A-l>', ':MoveHChar(1)<CR>', desc = 'Move Character Right' },
      { '<leader>wf', ':MoveWord(-1)<CR>', mode = { 'n' }, desc = 'Move Word Left' },
      { '<leader>wb', ':MoveWord(1)<CR>', mode = { 'n' }, desc = 'Move Word Right' },
      -- Visual Mode
      { '<A-j>', ':MoveBlock(1)<CR>', mode = { 'v' }, desc = 'Move Block Up' },
      { '<A-k>', ':MoveBlock(-1)<CR>', mode = { 'v' }, desc = 'Move Block Down' },
      { '<A-h>', ':MoveHBlock(-1)<CR>', mode = { 'v' }, desc = 'Move Block Left' },
      { '<A-l>', ':MoveHBlock(1)<CR>', mode = { 'v' }, desc = 'Move Block Right' },
    },
    opts = {
      -- Config here
    },
  },

  {
    'pmizio/typescript-tools.nvim',
    dependencies = { 'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig' },
    opts = {},
  },

  -- -- TypeScript LSP Configuration
  {
    'neovim/nvim-lspconfig',
    config = function()
      require('lspconfig').ts_ls.setup {
        settings = {
          javascript = {
            format = {
              tabSize = 2,
              indentSize = 2,
            },
          },
          typescript = {
            format = {
              tabSize = 2,
              indentSize = 2,
            },
          },
        },
        on_attach = function(client, bufnr)
          -- Disable formatting on save
          client.server_capabilities.documentFormattingProvider = false
        end,
      }
    end,

    -- GDScript enable --
    vim.lsp.config('gdscript', {}),
    vim.lsp.enable 'gdscript',
  },

  -- Filetype-specific settings for TypeScript files
  {
    'neovim/nvim-lspconfig',
    config = function()
      -- Apply settings specifically for TypeScript files
      vim.api.nvim_create_autocmd('FileType', {
        pattern = 'typescript,typescriptreact',
        command = 'setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab',
      })
    end,
  },
}
