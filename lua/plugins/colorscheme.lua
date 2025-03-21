-- return {
--  "AlphaTechnolog/pywal.nvim",
--   lazy = false,
--   priority = 1000,
--   config = function()
--     require("pywal").setup()
--   end,
-- }

return {
  "catppuccin/nvim",
  name = "catppuccin",
  config = function()
    vim.cmd("colorscheme catppuccin")
  end,
}
