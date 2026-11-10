vim.keymap.set("n", "<leader>cf", vim.lsp.buf.format, { desc = "[c]ode [f]ormat" })
vim.keymap.set("n", "<leader>cd", vim.diagnostic.open_float, { desc = "[c]ode [d]diagnostic" })

vim.keymap.set("n", "<leader><C-v>", ":vsplit<CR>", { desc = "split [v]ertical", silent = true })
vim.keymap.set("n", "<leader><C-h>", ":split<CR>", { desc = "split [h]orizontal", silent = true })

vim.keymap.set("n", "<S-h>", ":bprev<CR>", { desc = "previous buffer", silent = true })
vim.keymap.set("n", "<S-l>", ":bnext<CR>", { desc = "next buffer", silent = true })

vim.keymap.set("n", "<C-h>", ":wincmd h<CR>", { desc = "split on the left", silent = true })
vim.keymap.set("n", "<C-j>", ":wincmd j<CR>", { desc = "split on the bottom", silent = true })
vim.keymap.set("n", "<C-k>", ":wincmd k<CR>", { desc = "split on the top", silent = true })
vim.keymap.set("n", "<C-l>", ":wincmd l<CR>", { desc = "split on the right", silent = true })
