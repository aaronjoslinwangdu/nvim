return {
  {
    "williamboman/mason.nvim",
    -- pin mason version for now because of breaking changes in 2.0
    version = "1.11.0",
    opts = {
      ensure_installed = {
        "basedpyright",
        "debugpy",
        "ruff",
      },
      automatic_installation = true,
    },
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    -- pin mason version for now because of breaking changes in 2.0
    version = "1.32.0",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "vimls",
          "lua_ls",
          "ts_ls",
          "basedpyright",
          "html",
          "eslint",
          "astro",
          "cssls",
        },
        automatic_installation = true,
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local lspconfig = require("lspconfig")

      local servers_filters = {
        ["ts_ls"] = false,
        ["html"] = false,
        ["eslint"] = false, -- not for formatting
        ["cssls"] = false,
        ["basedpyright"] = false,
        ["lua_ls"] = false, -- we use stylua
        ["astro"] = false,
      }

      local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

      local lsp_formatting = function(bufnr)
        vim.lsp.buf.format({
          bufnr = bufnr,
          filter = function(client)
            return servers_filters[client.name]
          end,
        })
      end

      local on_attach = function(client, bufnr)
        -- if client.supports_method("textDocument/formatting") then
        -- 	vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
        -- 	vim.api.nvim_create_autocmd("BufWritePre", {
        -- 		group = augroup,
        -- 		buffer = bufnr,
        -- 		callback = function()
        -- 			lsp_formatting(bufnr)
        -- 		end,
        -- 	})
        -- end
      end

      local handlers = {
        ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" }),
        ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" }),
      }

      lspconfig.lua_ls.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        handlers = handlers,
        settings = {
          Lua = {
            diagnostics = {
              globals = {
                "vim",
              },
            },
          },
        },
      })

      lspconfig.basedpyright.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        handlers = handlers,
      })

      lspconfig.html.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        handlers = handlers,
      })

      lspconfig.cssls.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        handlers = handlers,
      })

      lspconfig.astro.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        handlers = handlers,
      })

      lspconfig.eslint.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        handlers = handlers,
      })

      lspconfig.ts_ls.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        handlers = handlers,
      })

      lspconfig.vimls.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        handlers = handlers,
      })

      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
      vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
      vim.keymap.set("n", "<leader>fu", vim.lsp.buf.references, {})
    end,
  },
}
