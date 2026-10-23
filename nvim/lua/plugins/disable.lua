return {
  { "nvim-mini/mini.pairs", enabled = false },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        bashls = { enabled = false },
      },
    },
  },
}
