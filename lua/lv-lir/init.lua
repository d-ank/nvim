local actions = require'lir.actions'
local mark_actions = require 'lir.mark.actions'
local clipboard_actions = require'lir.clipboard.actions'

require'lir'.setup {
	show_hidden_files = true,
	devicons_enable = false,
	mappings = {
		['<Cr>']     = actions.edit,
		['<C-s>'] = actions.split,
		['<C-v>'] = actions.vsplit,
		['<C-t>'] = actions.tabedit,

	    ['<Esc>']     = actions.up,
		['q']     = actions.quit,

	    ['e']     = actions.mkdir,
		['a']     = actions.newfile,
		['r']     = actions.rename,
		['@']     = actions.cd,
		['y']     = actions.yank_path,
		['d']     = actions.delete,
		['j'] = function()
			mark_actions.toggle_mark()
			vim.cmd('normal! j')
		end,
		['c'] = clipboard_actions.copy,
		['x'] = clipboard_actions.cut,
		['p'] = clipboard_actions.paste,
	},
	float = {
		size_percentage = 0.5,
		winblend = 15,
		border = true,
		borderchars = {"" , "" , "" , "" , "" , "" , "", ""},

		-- -- If you want to use `shadow`, set `shadow` to `true`.
		-- -- Also, if you set shadow to true, the value of `borderchars` will be ignored.
		-- shadow = false,
	},
	hide_cursor = false
}

-- use visual mode
function _G.LirSettings()
  vim.api.nvim_buf_set_keymap(0, 'x', 'J', ':<C-u>lua require"lir.mark.actions".toggle_mark("v")<CR>', {noremap = true, silent = true})

  -- lose focus closes
  vim.cmd [[augroup LirCloseOnWinLeave]]
  vim.cmd [[  autocmd!]]
  vim.cmd [[  autocmd WinLeave <buffer> if get(w:, 'lir_is_float', v:false) | call nvim_win_close(0, v:true) | endif]]
  vim.cmd [[augroup END]]

  -- echo cwd
  vim.api.nvim_echo({{vim.fn.expand('%:p'), 'Normal'}}, false, {})
end

vim.cmd [[augroup lir-settings]]
vim.cmd [[  autocmd!]]
vim.cmd [[  autocmd Filetype lir :lua LirSettings()]]
vim.cmd [[augroup END]]