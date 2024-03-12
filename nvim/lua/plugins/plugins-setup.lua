-- 自动安装packer
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

-- 保存此文件自动更新安装软件
-- 注意PackerCompile改成了PackerSync
-- plugins.lua改成了plugins-setup.lua，适应本地文件名字
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])

return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'
	use 'folke/tokyonight.nvim' -- 主题
   
    use {'hardhackerlabs/theme-vim',  as = 'hardhacker'}

	use {
    	'nvim-tree/nvim-tree.lua',  -- 文档树
    	requires = {
      	'nvim-tree/nvim-web-devicons', -- 文档树图标
    	}
  	}

	use "nvim-treesitter/nvim-treesitter" -- 语法高亮
	use "p00f/nvim-ts-rainbow" -- 配合treesitter，不同括号颜色区分

	use {
    	"williamboman/mason.nvim",
    	"williamboman/mason-lspconfig.nvim",  -- 这个相当于mason.nvim和lspconfig的桥梁
   		"neovim/nvim-lspconfig"
  	}

	    -- 自动补全
  	use "hrsh7th/nvim-cmp"
 	use "hrsh7th/cmp-nvim-lsp"
	use "L3MON4D3/LuaSnip" -- snippets引擎，不装这个自动补全会出问题
	use "saadparwaiz1/cmp_luasnip"
	use "rafamadriz/friendly-snippets"
	use "hrsh7th/cmp-path" -- 文件路径

    use "numToStr/Comment.nvim" -- gcc和gc注释
    use "windwp/nvim-autopairs" -- 自动补全括号

   
	use {
    	'nvim-telescope/telescope.nvim', tag = '0.1.3',  -- 文件检索
    	requires = { {'nvim-lua/plenary.nvim'} }
  	}

    

	if packer_bootstrap then
    	require('packer').sync()
	end




        --spawn: npm failed with exit code - and signal -. npm is not executable

end)
