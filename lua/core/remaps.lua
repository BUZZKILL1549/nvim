vim.g.mapleader = " "

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex);

vim.keymap.set("n", "<leader>nn", ":Noice history<CR>", { desc = "Open Notification History" })
vim.keymap.set("n", "<leader>nd", ":Noice dismiss<CR>", { desc = "Dismiss Notifications" })
