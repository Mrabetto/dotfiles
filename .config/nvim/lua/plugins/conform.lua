local M = {
    {
	'stevearc/conform.nvim',
	config = function ()
	    require("conform").setup({
		formatters = {
		    odinfmt = {
			-- Change where to find the command if it isn't in your path.
			command = "odinfmt",
			args = { "-stdin" },
			stdin = true,
		    },
		},
		formatters_by_ft = {
		    lua = { "stylua" },
		    -- Conform will run multiple formatters sequentially
		    python = { "isort", "black" },
		    -- You can customize some of the format options for the filetype (:help conform.format)
		    -- rust = { "rustfmt", lsp_format = "fallback" },
		    -- Conform will run the first available formatter
		    javascript = { "prettierd", "prettier", stop_after_first = true },
		    odin = { "odinfmt" },
		},
	    })
	end
    },
    {
	"stevearc/conform.nvim",
	opts = {
	    notify_on_error = false,
	    -- Odinfmt gets its configuration from odinfmt.json. It defaults
	    -- writing to stdout but needs to be told to read from stdin.
	    formatters = {
		odinfmt = {
		    -- Change where to find the command if it isn't in your path.
		    command = "odinfmt",
		    args = { "-stdin" },
		    stdin = true,
		},
	    },
	    -- and instruct conform to use odinfmt.
	    formatters_by_ft = {
		odin = { "odinfmt" },
	    },
	},
    }
}

return M
