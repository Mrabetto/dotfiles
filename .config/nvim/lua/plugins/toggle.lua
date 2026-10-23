local toggle = {
    "elentok/togglr.nvim",
    opts = {
	-- Specify key map (set to false or nil to disable)
	-- key = "<Leader>tw",		-- the OG
	-- key = "<C-a>",

	-- Specify which register to use (to avoid overriding the default register)
	-- register = "t",

	-- Enable debugging mode
	-- debug = true,

	-- Add custom sets to values to toggle between
	-- values = {
	--     ["value"] = "opposite-value",
	-- },

    }
}
-- require().setup(toggle.opts)

-- vim.keymap.set({'n', 'v'}, '<leader>ty', function ()
--     require('togglr').toggle_word()
-- end, {desc="prints out the type of the word under cursor"})

-- vim.keymap.set('n', '<C-a>', function toggle()
--     local word = vim.fn.exp("<cword>")
--     if type(word) == then
--     else
    	-- require('togglr').toggle_word()
--     end
-- end)
return toggle
