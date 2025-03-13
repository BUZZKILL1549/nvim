vim.g.mapleader = " "

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex);

-- notifications
vim.keymap.set("n", "<leader>nn", ":Noice history<CR>", { desc = "Open Notification History", silent = true })
vim.keymap.set("n", "<leader>nd", ":Noice dismiss<CR>", { desc = "Dismiss Notifications", silent = true })

-- tabs
vim.keymap.set("n", "<leader><Tab>", ":BufferNext<CR>", { desc = "Next Buffer", silent = true })
vim.keymap.set("n", "<leader><S-Tab>", ":BufferPrevious<CR>", { desc = "Previous Buffer", silent = true })
vim.keymap.set("n", "<leader>q", ":BufferClose<CR>", { desc = "Close Buffer", silent = true })

-- telescope
vim.keymap.set("n", "<leader>ff", ":Telescope find_files<CR>", { desc = "Find Files", silent = true })
vim.keymap.set("n", "<leader>fg", ":Telescope live_grep<CR>", { desc = "Live Grep", silent = true })
