return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "saadparwaiz1/cmp_luasnip",
    "hrsh7th/cmp-nvim-lsp",
    "L3MON4D3/LuaSnip",
    "rafamadriz/friendly-snippets",
  },
  config = function()
    local lspconfig = require("lspconfig")
    local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()
    require("luasnip.loaders.from_vscode").lazy_load()
    vim.opt.completeopt = { "menu", "menuone", "noselect" }
    local cmp = require("cmp")
    local luasnip = require("luasnip")
    local select_opts = { behavior = cmp.SelectBehavior.Insert }
    local sign = function(opts)
      vim.fn.sign_define(opts.name, {
        texthl = opts.name,
        text = opts.text,
        numhl = "",
      })
    end

    sign({ name = "DiagnosticSignError", text = "✘" })
    sign({ name = "DiagnosticSignWarn", text = "▲" })
    sign({ name = "DiagnosticSignHint", text = "⚑" })
    sign({ name = "DiagnosticSignInfo", text = "»" })

    vim.diagnostic.config({
      virutal_text = {
        prefix = "",
        spacing = 2,
      },
      signs = true,
      underline = true,
      update_in_insert = false,

      severity_sort = true,
      severity = {
        error = "Error",
        warn = "Warning",
        info = "Information",
        hint = "Hint",
      },

      float = {
        source = "always",
        border = "rounded",
        winblend = 10,
        max_width = 80,
      },
    })
    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })

    vim.lsp.handlers["textDocument/signatureHelp"] =
      vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })

    cmp.setup({
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      sources = {
        { name = "path" },
        { name = "nvim_lsp", keyword_length = 1 },
        { name = "buffer", keyword_length = 3 },
        { name = "luasnip", keyword_length = 2 },
      },
      window = {
        documentation = {
          border = "rounded",
          cmp.config.window.bordered(),
        },
      },
      formatting = {
        fields = { "menu", "abbr", "kind" },
        format = function(entry, item)
          local menu_icon = {
            nvim_lsp = "λ",
            luasnip = "⋗",
            buffer = "Ω",
            path = "🖫",
          }

          item.menu = menu_icon[entry.source.name]
          return item
        end,
      },
      mapping = {
        ["<C-p>"] = cmp.mapping.select_prev_item(select_opts),
        ["<C-n>"] = cmp.mapping.select_next_item(select_opts),
        ["<C-u>"] = cmp.mapping.scroll_docs(-4),
        ["<C-d>"] = cmp.mapping.scroll_docs(4),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<C-y>"] = cmp.mapping.confirm({ select = true }),
        ["<CR>"] = cmp.mapping.confirm({ select = false }),
        ["<C-f>"] = cmp.mapping(function(fallback)
          if luasnip.jumpable(1) then
            luasnip.jump(1)
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<C-b>"] = cmp.mapping(function(fallback)
          if luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<Tab>"] = cmp.mapping(function(fallback)
          local col = vim.fn.col(".") - 1

          if cmp.visible() then
            cmp.select_next_item(select_opts)
          elseif col == 0 or vim.fn.getline("."):sub(col, col):match("%s") then
            fallback()
          else
            cmp.complete()
          end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item(select_opts)
          else
            fallback()
          end
        end, { "i", "s" }),
      },
    })

    lspconfig.lua_ls.setup({
      capabilities = lsp_capabilities,
    })
    lspconfig.pyright.setup({
      capabilities = lsp_capabilities,
    })

    vim.api.nvim_create_autocmd("LspAttach", {
      desc = "LSP actions",
      callback = function()
        local bufmap = function(mode, lhs, rhs)
          local opts = { buffer = true }
          vim.keymap.set(mode, lhs, rhs, opts)
        end

        -- Displays hover information about the symbol under the cursor
        bufmap("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>")

        -- Jump to the definition
        bufmap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>")

        -- Jump to declaration
        bufmap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>")

        -- Lists all the implementations for the symbol under the cursor
        bufmap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>")

        -- Jumps to the definition of the type symbol
        bufmap("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>")

        -- Lists all the references
        bufmap("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>")

        -- Displays a function's signature information
        bufmap("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>")

        -- Renames all references to the symbol under the cursor
        bufmap("n", "<F2>", "<cmd>lua vim.lsp.buf.rename()<cr>")

        -- Selects a code action available at the current cursor position
        bufmap("n", "<F4>", "<cmd>lua vim.lsp.buf.code_action()<cr>")

        -- Show diagnostics in a floating window
        bufmap("n", "gl", "<cmd>lua vim.diagnostic.open_float()<cr>")

        -- Move to the previous diagnostic
        bufmap("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<cr>")

        -- Move to the next diagnostic
        bufmap("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<cr>")
      end,
    })
  end,
}
