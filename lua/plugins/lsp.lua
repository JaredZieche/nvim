return {
  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    build = ":MasonUpdate",
  },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {
        "lua_ls", "helm_ls", "gopls", "bashls", "jedi_language_server", "dockerls", "terraformls",
        "tsserver", "texlab", "yamlls", "jsonls", "ansiblels"
      },
    }
  },
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile"},
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    config = function ()
      local nvim_lsp = require("lspconfig")
      local opts = { noremap = true, silent = true }
      vim.api.nvim_set_keymap("n", "<space>e",
        "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
      vim.api.nvim_set_keymap("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>",
        opts)
      vim.api.nvim_set_keymap("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>",
        opts)
      vim.api.nvim_set_keymap("n", "<space>q",
        "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)
      vim.api.nvim_set_keymap("n", "<space>f",
        "<cmd>lua vim.lsp.buf.format()<CR>", opts)
      -- Use an on_attach function to only map the following keys
      -- after the language server attaches to the current buffer
      local on_attach = function(client, bufnr)
        -- Enable completion triggered by <c-x><c-o>
        vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

        -- Mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        vim.api.nvim_buf_set_keymap(bufnr, "n", "gD",
          "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
        vim.api.nvim_buf_set_keymap(bufnr, "n", "gd",
          "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
        vim.api.nvim_buf_set_keymap(bufnr, "n", "K",
          "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
        vim.api.nvim_buf_set_keymap(bufnr, "n", "gi",
          "<cmd>lua vim.lsp.buf.implementation()<CR>",
          opts)
        vim.api.nvim_buf_set_keymap(bufnr, "n", "<C-k>",
          "<cmd>lua vim.lsp.buf.signature_help()<CR>",
          opts)
        vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>wa",
          "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>",
          opts)
        vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>wr",
          "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>",
          opts)
        vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>wl",
          "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>",
          opts)
        vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>D",
          "<cmd>lua vim.lsp.buf.type_definition()<CR>",
          opts)
        vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>rn",
          "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
        vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>ca",
          "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
        vim.api.nvim_buf_set_keymap(bufnr, "n", "gr",
          "<cmd>lua vim.lsp.buf.references()<CR>", opts)
        require("aerial").on_attach(client, bufnr)
      end
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

      local servers = {
        "lua_ls", "helm_ls", "gopls", "bashls", "jedi_language_server", "dockerls", "terraformls",
        "tsserver", "texlab", "yamlls", "jsonls", "ansiblels"
      }
      for _, lsp in ipairs(servers) do
        nvim_lsp[lsp].setup {
          on_attach = on_attach,
          capabilities = capabilities,
          settings = {
            go = { analyses = { unusedparams = false }, staticcheck = true },
            json = {
              format = { enabled = false },
              schemas = {
                {
                  description = "ESLint config",
                  fileMatch = { ".eslintrc.json", ".eslintrc" },
                  url = "http://json.schemastore.org/eslintrc"
                }, {
                  description = "Package config",
                  fileMatch = { "package.json" },
                  url = "https://json.schemastore.org/package"
                }, {
                  description = "Packer config",
                  fileMatch = { "packer.json" },
                  url = "https://json.schemastore.org/packer"
                }, {
                  description = "Renovate config",
                  fileMatch = {
                    "renovate.json", "renovate.json5",
                    ".github/renovate.json", ".github/renovate.json5",
                    ".renovaterc", ".renovaterc.json"
                  },
                  url = "https://docs.renovatebot.com/renovate-schema"
                }, {
                  description = "OpenApi config",
                  fileMatch = { "*api*.json" },
                  url = "https://raw.githubusercontent.com/OAI/OpenAPI-Specification/main/schemas/v3.1/schema.json"
                }
              }
            },
            redhat = { telemetry = { enabled = false } },
            texlab = {
              auxDirectory = ".",
              bibtexFormatter = "texlab",
              build = {
                args = {
                  "--keep-intermediates", "--keep-logs", "--synctex", "%f"
                },
                executable = "tectonic",
                forwardSearchAfter = false,
                onSave = false
              },
              chktex = { onEdit = false, onOpenAndSave = false },
              diagnosticsDelay = 300,
              formatterLineLength = 80,
              forwardSearch = { args = {} },
              latexFormatter = "latexindent",
              latexindent = { modifyLineBreaks = false }
            },
            yaml = {
              schemaStore = {
                enable = true,
                url = "https://www.schemastore.org/api/json/catalog.json"
              },
              schemas = {
                kubernetes = "*.yaml",
                ["http://json.schemastore.org/github-workflow"] = ".github/workflows/*.{yml,yaml}",
                ["http://json.schemastore.org/github-action"] = ".github/action.{yml,yaml}",
                ["http://json.schemastore.org/ansible-stable-2.9"] = "roles/tasks/*.{yml,yaml}",
                ["http://json.schemastore.org/prettierrc"] = ".prettierrc.{yml,yaml}",
                ["http://json.schemastore.org/kustomization"] = "kustomization.{yml,yaml}",
                ["http://json.schemastore.org/ansible-playbook"] = "ansible/play*.{yml,yaml}",
                ["http://json.schemastore.org/chart"] = "Chart.{yml,yaml}",
                ["https://json.schemastore.org/dependabot-v2"] = ".github/dependabot.{yml,yaml}",
                ["https://json.schemastore.org/gitlab-ci"] = "*gitlab-ci*.{yml,yaml}",
                ["https://raw.githubusercontent.com/OAI/OpenAPI-Specification/main/schemas/v3.1/schema.json"] = "*api*.{yml,yaml}",
                ["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] = "docker-compose.{yml,yaml}"
              },
              format = { enabled = false },
              validate = false, -- TODO: conflicts between Kubernetes resources and kustomization.yaml
              completion = true,
              hover = true
            }
          },
          flags = { debounce_text_changes = 150 }
        }
      end

      require "lspconfig".lua_ls.setup {
        capabilities = capabilities,
        on_attach = on_attach,
        settings = {
          Lua = {
            runtime = { version = "LuaJIT" },
            completion = { enable = true, callSnippet = "Both" },
            diagnostics = {
              enable = true,
              globals = { "vim", "describe" },
              disable = { "lowercase-global" }
            },
            workspace = {
              library = {
                [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
                [vim.fn.expand("/usr/share/awesome/lib")] = true
              },
              -- adjust these two values if your performance is not optimal
              maxPreload = 2000,
              preloadFileSize = 1000
            },
            telemetry = { enable = false }
          }
        }
      }

      require "lspconfig".helm_ls.setup {
        on_attach = on_attach,
        filetypes = { "helm" },
        cmd = { "helm_ls", "serve" },
        capabilities = capabilities
      }
    end
  },
  {
    "mhartington/formatter.nvim",
    opts = {
      filetype = {
        lua = {
            function()
                return {
                    exe = "lua-format",
                    args = {
                        "-i", "--no-keep-simple-function-one-line",
                        "--no-break-after-operator", "--break-after-table-lb",
                        "--no-break-before-functioncall-rp",
                        "--no-chop-down-parameter",
                        "--single-quote-to-double-quote",
                        "--no-keep-simple-control-block-one-line",
                        "--no-keep-simple-function-one-line",
                        "--no-break-after-functioncall-lp"
                    },
                    stdin = true
                }
            end
        },
        go = {
            function()
                return {
                    exe = "gofmt",
                    args = {
                        "-w", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0))
                    },
                    stdin = false
                }
            end
        },
        json = {
            function()
                return {
                    exe = "prettier",
                    args = {
                        "--stdin-filepath", "--tab-width 4",
                        vim.fn.fnameescape(vim.api.nvim_buf_get_name(0))
                    },
                    stdin = true
                }
            end
        },
        markdown = {
            function()
                return {
                    exe = "prettier",
                    args = {
                        "--stdin-filepath",
                        vim.fn.fnameescape(vim.api.nvim_buf_get_name(0))
                    },
                    stdin = true
                }
            end
        },
        python = {
            function()
                return {exe = "black", args = {"-"}, stdin = true}
            end
        },
        tf = {
            function()
                return {exe = "terraform", args = {"fmt", "-"}, stdin = true}
            end
        },
        yaml = {
            function()
                return {
                    -- exe = "yamlfix",
                    -- args = {vim.fn.fnameescape(vim.api.nvim_buf_get_name(0))},
                    exe = "prettier",
                    args = {"--single-quote", "false", "--parser", "yaml"},
                    stdin = true
                }
            end
        }
      }
    },
    config = function ()
      -- autocmd BufWritePre * undojoin | FormatWrite
      -- autocmd for terraform is in ../../ftplugin/tf.lua
      vim.api.nvim_exec([[
      augroup FormatAutogroup
        autocmd!
        autocmd BufWritePost *.md,*.lua,*.go,*.py,*.json,*.tf FormatWrite
      augroup END
      ]], true)
    end
  },
  {"onsails/lspkind-nvim", dependencies = {"famiu/bufdelete.nvim"}},
  {
    "ray-x/lsp_signature.nvim",
    event = "VeryLazy",
    dependencies = {"neovim/nvim-lspconfig"},
    opts = {
      bind = true, -- This is mandatory, otherwise border config won't get registered.
      floating_window = true, -- show hint in a floating window, set to false for virtual text only mode
      doc_lines = 2, -- Set to 0 for not showing doc
      hint_prefix = "🐼 ",
      -- use_lspsaga = false,  -- set to true if you want to use lspsaga popup
      handler_opts = {
        border = "single" -- double, single, shadow, none
      }
    }
  }
}
