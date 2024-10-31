local M = {
  "neovim/nvim-lspconfig",
  commit = "0ef64599b8aa0187ee5f6d92cb39c951f348f041",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    {
      "folke/neodev.nvim",
      commit = "84e0290f5600e8b89c0dfcafc864f45496a53400",
    },
  },
}

local function lsp_keymaps(bufnr)
  local opts = { noremap = true, silent = true }
  local keymap = vim.api.nvim_buf_set_keymap
  keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
  keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
  keymap(bufnr, "n", "<c-k>", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
  keymap(bufnr, "n", "gI", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
  keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
  keymap(bufnr, "n", "<leader>d", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
end

M.on_attach = function(client, bufnr)
  lsp_keymaps(bufnr)
end

function M.common_capabilities()
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities.textDocument.completion.completionItem.snippetSupport = true
  return capabilities
end

function M.config()
  local wk = require "which-key"
  wk.register {
    ["<leader>la"] = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
    ["<leader>lf"] = {
      '<cmd>lua vim.lsp.buf.format({ async = true })<cr>', "Format"
    },
    ["<leader>li"] = { "<cmd>LspInfo<cr>", "Info" },
    ["<leader>lj"] = { "<cmd>lua vim.diagnostic.goto_next()<cr>", "Next Diagnostic" },
    ["<leader>lk"] = { "<cmd>lua vim.diagnostic.goto_prev()<cr>", "Prev Diagnostic" },
    ["<leader>ll"] = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
    ["<leader>lq"] = { "<cmd>lua vim.diagnostic.setloclist()<cr>", "Quickfix" },
    ["<leader>lr"] = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
  }

  local lspconfig = require "lspconfig"

  local servers = require "lspsettings.servers"

  local signs = {
    { name = "DiagnosticSignError", hl = "DiagnosticError" },
    { name = "DiagnosticSignWarn",  hl = "DiagnosticWarn" },
    { name = "DiagnosticSignHint",  hl = "DiagnosticHint" },
    { name = "DiagnosticSignInfo",  hl = "DiagnosticInfo" },
  }

  for _, sign in ipairs(signs) do
    vim.fn.sign_define(sign.name, { texthl = sign.name, text = "", numhl = sign.hl })
  end

  local default_diagnostic_config = {
    signs = {
      active = signs,
    },
    virtual_text = false,
    update_in_insert = false,
    underline = true,
    severity_sort = true,
    float = {
      focusable = false,
      style = "minimal",
      border = "rounded",
      source = "always",
      header = "",
      prefix = "",
    },
  }

  vim.diagnostic.config(default_diagnostic_config)

  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
  vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })
  require("lspconfig.ui.windows").default_options.border = "rounded"

  for _, server in pairs(servers) do
    local opts = {
      on_attach = M.on_attach,
      capabilities = M.common_capabilities(),
    }

    local require_ok, settings = pcall(require, "lspsettings." .. server)
    if require_ok then
      opts = vim.tbl_deep_extend("force", settings, opts)
    end

    if server == "lua_ls" then
      require("neodev").setup {}
    end

    if server == "denols" then
      local custom_opts = {
        root_dir = lspconfig.util.root_pattern("deno.json", "deno.jsonc")
      }
      opts = vim.tbl_deep_extend("force", custom_opts, opts)
    end

    if server == "tsserver" then
      local custom_opts = {
        root_dir = function(filename, bufnr)
          local denoRootDir = lspconfig.util.root_pattern("deno.json", "deno.json")(filename);
          if denoRootDir then
            return nil;
          end

          return lspconfig.util.root_pattern("package.json")(filename);
        end,
        single_file_support = false,
      }
      opts = vim.tbl_deep_extend("force", custom_opts, opts)
    end

    lspconfig[server].setup(opts)
  end
end

return M
