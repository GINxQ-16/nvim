return {
  -- lsp installation
  {
    'williamboman/mason-lspconfig.nvim',
    dependencies = {
      'williamboman/mason.nvim',
      cmd = 'Mason',
      opts = {
        ui = {
          border = 'rounded',
          width = 0.8,
          height = 0.7,
          icons = {
            package_installed = '󰺧',
            package_pending = '',
            package_uninstalled = '󰺭',
          },
        },
      },
    },
    opts = {
      automatic_installation = true,
      ensure_installed = {
        'clangd',
        'vimls',
        'lua_ls',
        'html',
        'cssls',
        'tsserver',
        'volar',
        'jsonls',
        'tailwindcss',
      },
    },
  },

  -- lsp
  {
    'neovim/nvim-lspconfig',
    event = 'VeryLazy',
    dependencies = {
      'folke/neodev.nvim',
      opts = {},
    },
    config = function()
      local lspconfig = require 'lspconfig'

      -- diagnostic
      vim.diagnostic.config {
        virtual_text = false,
        float = { border = 'rounded' },
      }

      -- set signs
      local signs = { Error = '', Warn = '', Hint = '', Info = '' }
      for type, icon in pairs(signs) do
        local hl = 'DiagnosticSign' .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
      end

      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('UserLspConfig', {}),
        callback = function(ev)
          vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

          local opts = { buffer = ev.buf }
          vim.keymap.set('n', '<space>gd', vim.lsp.buf.type_definition, opts)
          vim.keymap.set('n', '<space>gr', vim.lsp.buf.references, opts)
          vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
          vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
        end,
      })

      -- autocompletion
      local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

      local servers = {
        'clangd',
        'vimls',
        'html',
        'cssls',
        'jsonls',
        'tailwindcss',
      }
      for _, lsp in ipairs(servers) do
        lspconfig[lsp].setup {
          capabilities = capabilities,
        }
      end

      lspconfig.lua_ls.setup {
        capabilities = capabilities,
        settings = {
          Lua = {
            diagnostics = {
              globals = { 'vim' },
            },
          },
        },
      }

      -- vue
      local getServerPath = function(package_name, server_path)
        local mason_registry = require 'mason-registry'
        return mason_registry.get_package(package_name):get_install_path() .. server_path
      end

      local vue_language_server_path = getServerPath('vue-language-server', '/node_modules/@vue/language-server')
      local typescript_language_server_path =
        getServerPath('typescript-language-server', '/node_modules/typescript/lib')

      lspconfig.tsserver.setup {
        capabilities = capabilities,
        filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
        init_options = {
          plugins = {
            {
              name = '@vue/typescript-plugin',
              location = vue_language_server_path,
              languages = { 'vue' },
            },
          },
        },
      }
      lspconfig.volar.setup {
        init_options = {
          typescript = {
            tsdk = typescript_language_server_path,
          },
        },
      }
    end,
  },
}
