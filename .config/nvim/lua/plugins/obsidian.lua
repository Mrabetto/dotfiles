M2 = {
    "obsidian-nvim/obsidian.nvim",
    version = "*", -- use latest release, remove to use latest commit
    ---@module 'obsidian'
    ---@type obsidian.config
    opts = {
	legacy_commands = false, -- this will be removed in 4.0.0
	workspaces = {
	    {
		name = "Misc",
		path = "~/Documents/Research/Misc/",
	    },
	    {
		name = "phone",
		path = "~/storage/shared/Kde/markdown/"
	    }

	},
	ui = {
	    enable =false,
	},

	---@class obsidian.config.CheckboxOpts
	---
	---@field enabled? boolean
	---
	---Order of checkbox state chars, e.g. { " ", "x" }
	---@field order? string[]
	---
	---Whether to create new checkbox on paragraphs
	---@field create_new? boolean
	checkbox = {
	    enabled = true,
	    create_new = true,
	    order = { " ", "~", "!", "x",">" },
	},
    },
}
Old = {
    "epwalsh/obsidian.nvim",
    version = "*",  -- recommended, use latest release instead of latest commit
    lazy = true,
    ft = "markdown",
    -- replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
    -- event = {
	--   -- if you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
	--   -- e.g. "bufreadpre " .. vim.fn.expand "~" .. "/my-vault/*.md"
	--   -- refer to `:h file-pattern` for more examples
	--   "bufreadpre path/to/my-vault/*.md",
	--   "bufnewfile path/to/my-vault/*.md",
	-- },

	dependencies = {
	    -- required.
	    "nvim-lua/plenary.nvim",

	    -- see below for full list of optional dependencies 👇
	},
	opts = {
	    ui = {
		enable = false,
		[" "] = { char = "󰄱", hl_group = "obsidiantodo" },
		["x"] = { char = "", hl_group = "obsidiandone" },
		["f"] = { char = "", hl_group = "obsidianrightarrow" },
		["~"] = { char = "󰰱", hl_group = "obsidiantilde" },
		["!"] = { char = "", hl_group = "obsidianimportant" },
		["?"] = { char = "", hl_group = "obsidiantilde" },
	    },
	    workspaces = {
		{
		    name = "misc",
		    path = "~/documents/research/misc/",
		},
	    },
	    checkbox = {
		enabled = true,
		create_new = true,
		order = { " ", "~", "!", "f", "x" },
	    },
	    -- see below for full list of options 👇
	},
	opts_2 = {
	    ui = {
		enable = false,
	    },
	    workspaces = {
		-- {
		--     name = "misc",
		--     path = "~/documents/research/misc/",
		-- },
		{
		    name = "phone",
		    path = "~/storage/shared/Kde/markdown/"
		},
	    },
	    checkbox = {
		enabled = true,
		create_new = true,
		order = { " ", "~", "!", "f", "x" },
	    },
	    mappings = {
		["<CR>"] = {
		    action = function()
			return require("obsidian").util.toggle_checkbox()
		    end,
		    opts = { buffer = true, expr = true },
		},
	    },
	}
    }

    return M2
