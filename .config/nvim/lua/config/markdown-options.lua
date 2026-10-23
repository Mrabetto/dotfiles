-- local value = true
-- if value then
vim.api.nvim_create_autocmd(
    "FileType",
    {
	pattern="markdown",
	callback = function ()
	    vim.opt_local.comments:append("b:-")
	    vim.opt_local.formatoptions:append("ro")
	    -- print("formatoptions on this buffer are : " .. vim.cmd("set formatoptions?"))
	end
    }
)
-- end
