vim.api.nvim_set_keymap('i', '<Tab>', 'pumvisible() ? "<C-n>" : "<Tab>"', {noremap = true, expr = true})
vim.api.nvim_set_keymap('i', '<S-Tab>', 'pumvisible() ? "<C-n>" : "<S-Tab>"', {noremap = true, expr = true})
vim.api.nvim_command('au BufEnter * lua require\'completion\'.on_attach()')
vim.api.nvim_command('set completeopt=menuone,noinsert,noselect')

vim.g.completion_docked_hover = 1
vim.g.completion_docked_maximum_size = 7
vim.g.completion_enable_snippet = 'vim-vsnip'