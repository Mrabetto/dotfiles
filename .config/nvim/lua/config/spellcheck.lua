-- vim.api.nvim_create_autocmd("FileType",{
--     pattern = "markdown",
--     callback = function (args)
-- 	local data = args.data
-- 	local spelle = function ()
-- 		vim.spell.check(data)
-- 	end
--     	-- vim.keymap.set("n","<leader>sc",spelle)
-- 	print(args)
--     end
-- })


local spll = function ()
    vim.cmd.normal(']s')
end

vim.keymap.set("n",'<leader>sc',)
