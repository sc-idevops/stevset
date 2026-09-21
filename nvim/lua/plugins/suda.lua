return {
  {
    "lambdalisue/vim-suda",
    event = "BufRead",
    config = function()
      -- Enable smart edit: automatically switch to suda if a file is unreadable/unwritable
      vim.g.suda_smart_edit = 1
    end,
  },
}
