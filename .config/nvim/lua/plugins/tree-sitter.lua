-- return{}
return{
{
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    config = function()
	local configs = require"nvim-treesitter"
	-- configs.setup({
	--     highlight = { enable = true,},
	--     indent = { enable = true,},
	--     autotag = { enable = true,},
	--     ensure_installed = {
	-- 	"lua",
	-- 	"py",
	-- 	"kdl",
	-- 	"html",
	-- 	"css",
	-- 	"js",
	-- 	"java",
	-- 	"c",
	--     },
	--     auto_install = false,
	-- })
	
	require'nvim-treesitter'.setup {
	    -- Directory to install parsers and queries to (prepended to `runtimepath` to have priority)
	    install_dir = vim.fn.stdpath('data') .. '/site'
	}

	require'nvim-treesitter'.install { 'rust', 'javascript', 'zig', 'python' , 'html', 'css','kdl', 'c'}

	vim.api.nvim_create_autocmd('FileType', {
	    pattern = { 'rust', 'javascript', 'zig', 'python' , 'html', 'css','kdl','c' },
	    callback = function() vim.treesitter.start() end,
	})

	-- vim.wo[0][0].foldexpr = 'v:lua.vim.treesitter.foldexpr()'
	-- vim.wo[0][0].foldmethod = 'expr'
	-- require("nvim-treesitter.configs").setup({
	--     -- Directory to install parsers and queries to (prepended to `runtimepath` to have priority)
	--     install_dir = vim.fn.stdpath('data') .. '/site'
	-- })
    end
},
}
