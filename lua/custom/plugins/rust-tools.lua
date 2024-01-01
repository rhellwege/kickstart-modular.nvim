local on_attach = require('lsp-setup').on_attach
local capabilities = require('lsp-setup').capabilities

return {
  "simrat39/rust-tools.nvim",
  ft = "rust",
  dependencies = "neovim/nvim-lspconfig",
  opts = function ()
    return {
      server = {
        on_attach = on_attach,
        capabilities = capabilities,
      },
    }
  end,
  config = function(_, opts)
   require('rust-tools').setup(opts)
  end
}
