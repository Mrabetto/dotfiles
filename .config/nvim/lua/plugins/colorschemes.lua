return{
	   {
	"tiagovla/tokyodark.nvim",
	opts = {
	    -- custom options here
	},
	config = function(_, opts)
	    require("tokyodark").setup(opts) -- calling setup is optional
	    -- vim.cmd [[colorscheme tokyodark]]
	    local default_config = {
		transparent_background = false, -- set background to transparent
		gamma = 1.00, -- adjust the brightness of the theme
		styles = {
		    comments = { italic = true }, -- style for comments
		    keywords = { italic = true }, -- style for keywords
		    identifiers = { italic = true }, -- style for identifiers
		    functions = {}, -- style for functions
		    variables = {}, -- style for variables
		},
		custom_highlights = {} or function(highlights, palette) return {} end, -- extend highlights
		custom_palette = {} or function(palette) return {} end, -- extend palette
		terminal_colors = true, -- enable terminal colors
	    }
	end,
	   },
	   {
	'AlexvZyl/nordic.nvim',
	lazy = false,
	-- priority = 1000,
	config = function()
	    require('nordic').load()
	end
	   }, 
    { -- You can easily change to a different colorscheme.
	-- Change the name of the colorscheme plugin below, and then
	-- change the command in the config to whatever the name of that colorscheme is.
	--
	-- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
	'folke/tokyonight.nvim',
	priority = 1000, -- Make sure to load this before all the other start plugins.
	config = function()
	    ---@diagnostic disable-next-line: missing-fields
	    require('tokyonight').setup {
		styles = {
		    comments = { italic = false }, -- Disable italics in comments
		},
	    }

	    -- Load the colorscheme here.
	    -- Like many other themes, this one has different styles, and you could load
	    -- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
	    vim.cmd.colorscheme 'tokyonight-night'
	end,
    },
}
