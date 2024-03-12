local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end
local packer_bootstrap = ensure_packer()



vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

return require('packer').startup(function(use)
        use 'wbthomason/packer.nvim'


        use { 'williamboman/mason.nvim' }
        use { 'williamboman/mason-lspconfig.nvim'}

		use { 'neovim/nvim-lspconfig' }
		use { 'hrsh7th/nvim-cmp', config = [[require('config.nvim-cmp')]] }
		use { 'hrsh7th/cmp-nvim-lsp', after = 'nvim-cmp' }
		use { 'hrsh7th/cmp-buffer', after = 'nvim-cmp' } -- buffer auto-completion
		use { 'hrsh7th/cmp-path', after = 'nvim-cmp' } -- path auto-completion
		use { 'hrsh7th/cmp-cmdline', after = 'nvim-cmp' } -- cmdline auto-completion
		use 'L3MON4D3/LuaSnip'
		use 'saadparwaiz1/cmp_luasnip'



        
        use 'tanvirtin/monokai.nvim'
        
        if packer_bootstrap then
            require('packer').sync()
        end
    end)
