-- return {
    --
    -- }

-- require('plugins.obsidian').setup({
--     ui = { enable = false },
-- })

return{
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.nvim' },            -- if you use the mini.nvim suite
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.icons' },        -- if you use standalone mini plugins
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {
	preset="obsidian",
	-- render_modes = true,
	checkbox={
	    checked = {
		icon = ' ',
		highlight = 'RenderMarkdownChecked',
		scope_highlight = nil,
	    },
	    custom={
		warn = {
		    raw = '[!]',
		    rendered = ' ',
		    highlight = 'DiagnosticWarn',
		},
		forwarded = {
		    raw = '[>]',
		    rendered = '󰒊 ',
		    highlight = 'RenderMarkdownTodo',
		},
		checked = {
		    raw = '[~]',
		    rendered = ' ',
		    highlight = 'RenderMarkdownChecked',
		},
	    },
	},
	completions = { lsp = { enabled = true } },
    code = {
        language_border = ' ',
	language_left = '',
	language_right = '',
	width = 'block',
	min_width = 45,
	left_pad = 2,
	language_pad = 2,
	left_margin = 4,
    },
},
}
