--local colorscheme = require('base16-colorscheme')
vim.cmd('let g:nvcode_termcolors=256')

vim.cmd('set termguicolors')
vim.cmd('colorscheme ' .. O.colorscheme)
vim.cmd('hi BufferInactive guibg=#2b2b2b guifg=#767676')
vim.cmd('hi BufferInactiveSign guibg=#2b2b2b guifg=#767676')

-- Git signs
vim.cmd('hi GitSignsAdd guibg=#313335 guifg=#647e54')
vim.cmd('hi GitSignsChange guibg=#313335 guifg=#d0a45e')
vim.cmd('hi GitSignsDelete guibg=#313335 guifg=#c87631')