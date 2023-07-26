-- Setup nvim-cmp.
return {
    "hrsh7th/nvim-cmp",
    dependencies = {
        "hrsh7th/cmp-nvim-lsp", "hrsh7th/cmp-buffer", "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline", "saadparwaiz1/cmp_luasnip", "f3fora/cmp-spell",
        "hrsh7th/cmp-calc", "hrsh7th/cmp-emoji"
    },
    config = function()
        local cmp = require "cmp"
        local lspkind = require("lspkind")
        local luasnip = require("luasnip")

        local has_words_before = function()
            local line, col = unpack(vim.api.nvim_win_get_cursor(0))
            return col ~= 0
                       and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(
                           col, col):match("%s") == nil
        end

        local feedkey = function(key, mode)
            vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true,
                                                                 true, true),
                                  mode, true)
        end

        lspkind.init({
            symbol_map = {
                Text = "",
                Method = "",
                Function = "",
                Constructor = "",
                Field = "ﰠ",
                Variable = "",
                Class = "ﴯ",
                Interface = "",
                Module = "",
                Property = "ﰠ",
                Unit = "塞",
                Value = "",
                Enum = "",
                Keyword = "",
                Snippet = "",
                Color = "",
                File = "",
                Reference = "",
                Folder = "",
                EnumMember = "",
                Constant = "",
                Struct = "פּ",
                Event = "",
                Operator = "",
                TypeParameter = ""
            }
        })

        cmp.setup({
            formatting = {
                format = lspkind.cmp_format {
                    with_text = false,
                    maxwidth = 50,
                    menu = {
                        buffer = "BUF",
                        nvim_lsp = "LSP",
                        path = "PATH",
                        luasnip = "SNIP",
                        calc = "CALC",
                        spell = "SPELL",
                        emoji = "EMOJI"
                    }
                }
            },
            experimental = {native_menu = false, ghost_text = false},
            snippet = {
                expand = function(args)
                    require("luasnip").lsp_expand(args.body)
                end
            },
            mapping = {
                ["<C-p>"] = cmp.mapping.select_prev_item(),
                ["<C-n>"] = cmp.mapping.select_next_item(),
                ["<C-d>"] = cmp.mapping.scroll_docs(-4),
                ["<C-f>"] = cmp.mapping.scroll_docs(4),
                ["<C-Space>"] = cmp.mapping.complete(),
                ["<C-e>"] = cmp.mapping.close(),
                ["<CR>"] = cmp.mapping.confirm {
                    behavior = cmp.ConfirmBehavior.Replace,
                    select = false
                },
                ["<Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_next_item()
                    elseif luasnip.expand_or_jumpable() then
                        luasnip.expand_or_jump()
                    elseif has_words_before() then
                        cmp.complete()
                    else
                        fallback()
                    end
                end, {"i", "s"}),

                ["<S-Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_prev_item()
                    elseif luasnip.jumpable(-1) then
                        luasnip.jump(-1)
                    else
                        fallback()
                    end
                end, {"i", "s"})
            },
            sources = {
                {name = "nvim_lsp"}, {name = "buffer", keyword_length = 5},
                {name = "luasnip"}, {name = "calc"}, {name = "emoji"},
                {name = "spell"}, {name = "path"}
            }
        })

        -- Use buffer source for `/`.
        cmp.setup.cmdline("/", {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources({{name = "buffer"}},
                                         {{name = "cmdline"}})
        })

        -- Use cmdline & path source for ':'.
        cmp.setup.cmdline(":", {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config
                .sources({{name = "path"}}, {{name = "cmdline"}})
        })
    end
}
