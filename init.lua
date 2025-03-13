-- disabling netrw for nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.termguicolors = true

require("core")
require("lazi")

-- copying
vim.api.nvim_set_keymap('n', '<leader>y', '"+y', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<leader>y', '"+y', { noremap = true, silent = true })

-- pasting
vim.api.nvim_set_keymap('n', '<leader>p', '"+p', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<leader>p', '"+p', { noremap = true, silent = true })

-- autoformat on save (python)
vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = "*.py",
  callback = function()
    vim.lsp.buf.format({ async = true })
    vim.cmd("silent! !isort " .. vim.fn.expand("%"))
  end,
})

-- autoformat on save (rust)
vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = "*.rs",
  callback = function()
    vim.lsp.buf.format({ async = true })
  end,
})
