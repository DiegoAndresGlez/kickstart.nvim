-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
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
