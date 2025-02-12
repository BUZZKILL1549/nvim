return {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function()
    require('toggleterm').setup({
      size = 15,
      open_mapping = [[<C-\>]],
      hide_numbers = true,
      shade_terminals = true,
      start_in_insert = true,
      direction = "float",
      float_ops = {
        border = "curved",
        winblend = 3
      },
    })
  end,
}
