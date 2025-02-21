return {
  "nvim-telescope/telescope.nvim",
  keys = function()
    return {
      { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
      { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Live Grep" },
    }
  end,
}
