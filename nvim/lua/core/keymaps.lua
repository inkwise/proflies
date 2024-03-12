

vim.g.mapleader = "="

local keymap = vim.keymap

-- ---------- 视觉模式 ---------- ---



-- ---------- 插入模式 ---------- ---
keymap.set("n", "u", ":set paste<CR>i") -- 水平新增窗口 

-- ---------- 插件 ---------- ---
-- -- nvim-tree
keymap.set("n", "<F2>", ":NvimTreeToggle<CR>")
