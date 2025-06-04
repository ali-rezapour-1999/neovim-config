local lspconfig = require "nvchad.configs.lspconfig"

lspconfig.defaults()

local servers = { "html", "cssls", "tailwindcss", "ts_ls", "yamlls", "pyright", "gopls" }

for _, lsp in ipairs(servers) do
  local opts = {
    on_attach = lspconfig.on_attach,
    capabilities = lspconfig.capabilities,
  }

  if lsp == "pyright" then
    opts.settings = {
      python = {
        analysis = {
          autoSearchPaths = true,
          useLibraryCodeForTypes = true,
          diagnosticMode = "workspace",
          typeCheckingMode = "basic",
          extraPaths = { "./" },
        },
      },
    }
  elseif lsp == "ts_ls" then
    opts.settings = {
      typescript = {
        inlayHints = {
          includeInlayParameterNameHints = "all",
          includeInlayFunctionLikeReturnTypeHints = true,
        },
      },
    }
  elseif lsp == "gopls" then
    opts.settings = {
      gopls = {
        analyses = {
          unusedparams = true,
          shadow = true,
        },
        staticcheck = true,
      },
    }
  end

  require("lspconfig")[lsp].setup(opts)
end
