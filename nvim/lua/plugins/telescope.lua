local builtin = require('telescope.builtin')

-- 进入telescope页面会是插入模式，回到正常模式就可以用j和k来移动了

vim.keymap.set('n', '<F5>', builtin.find_files, {})
vim.keymap.set('n', '<F6>', builtin.live_grep, {})  -- 环境里要安装ripgrep
vim.keymap.set('n', '<F11>', builtin.buffers, {})
vim.keymap.set('n', '<F12>', builtin.help_tags, {})
