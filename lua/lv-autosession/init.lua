local opts = {
    log_level = 'info',
    auto_session_enable_last_session = false,
    auto_session_root_dir = vim.fn.stdpath('data').."/sessions/",
    auto_session_enabled = true,
    auto_save_enabled = true,
    auto_restore_enabled = true,
    auto_session_suppress_dirs = nil
}

-- kill float (https://github.com/tamago324/lir.nvim/blob/6476c19c8a82497aff06585350aa093a7929af43/lua/lir/float/init.lua#L95-L98)
--vim.g.auto_session_pre_save_cmds = ""

require('auto-session').setup(opts)