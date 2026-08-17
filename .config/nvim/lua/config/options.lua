vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.shiftwidth = 4
vim.opt.clipboard = 'unnamedplus'
vim.opt.showtabline = 2
vim.opt.scrolloff= 10
vim.opt.undofile=true
vim.opt.undodir = vim.fn.stdpath('state') .. '/undo//'
-- vim.o.textwidth=80
-- vim.o.columns=180
vim.o.ignorecase = true -- Case-insensitive searching UNLESS \C or capital in search (default: false)

vim.o.inccommand = 'split'

-- conceal level for obsidian "extra" ui features 
vim.o.conceallevel = 1

vim.o.splitbelow = true
vim.o.splitright = true




-- vim.cmd.colorscheme='tokyonight-night'
-- vim.o.conceallevel = 0 -- So that `` is visible in markdown files (default: 1)




-- require('telescope').setup {  
--   defaults = {  
--     mappings = {  
--       i = {  
--         ["<CR>"] = require('telescope.actions').select_tab,  
--       },  
--       n = {  
--         ["<CR>"] = require('telescope.actions').select_tab,  
--       },  
--     },  
--   },  
-- }


-- custom setting to open selected telescope entry in a new tab if not already open
local action_set = require('telescope.actions.set')  
local action_state = require('telescope.actions.state')  
  
-- Make select_tab only work when file is not already open  
-- action_set.select:replace_if(  
--   function()  
--     local entry = action_state.get_selected_entry()  
--     return entry and entry.bufnr ~= nil  
--   end,  
--   function(prompt_bufnr, type)  
--     -- If file is already open, use default instead of tab  
--     return action_set.select(prompt_bufnr, "default")  
--   end  
-- )

--- highlight on yank (from kickstart)
vim.api.nvim_create_autocmd('TextYankPost', {
    desc = 'Highlight when yanking (copying) text',
    group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
    callback = function() vim.hl.on_yank() end,
})

-- folding option, stolen from lehoangan2906
-- vim.opt.foldmethod = "syntax"   -- or "indent"
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldlevelstart = 99     -- start with all folds open
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "javascript", "typescript", "c", "cpp", "odin"},
    callback = function()
	-- vim.opt_local.foldmethod = "expr"
	-- vim.opt_local.foldexpr = "nvim_treesitter#foldexpr()"
	vim.wo[0][0].foldexpr = 'v:lua.vim.treesitter.foldexpr()'
	vim.wo[0][0].foldmethod = 'expr'
    end,
})
vim.api.nvim_create_autocmd("FileType", {
    pattern = "python",
    callback = function()
	vim.opt_local.foldmethod = "indent"
	vim.opt_local.foldlevel = 99
    end,
})

-- Prevent automatic comment continuation
vim.opt.formatoptions:remove {'r', 'o'}


--- trying to make an autosave command after leaving insert mode in a markdown file
vim.api.nvim_create_autocmd({'TextChanged','InsertLeave'},{
    desc = 'Autosave markdown',
    pattern="*.md",
    callback = function ()
	-- print("this works")
	vim.cmd.write()
    end
})

--- wrapping words in markdown (in white space chars and non words etc...)
vim.api.nvim_create_autocmd("FileType",{
    pattern = "markdown",
    callback = function ()
	-- vim.o.linebreak(true)
	-- option for line to break only at white spaces/non word char(\(,.;'")
	vim.opt_local.linebreak = true
	-- vim.bo.spell = true
	-- vim.opt_local.spelllang = { "en_us", "fr" }
	vim.cmd('setlocal spell spelllang=en_us,fr')

	-- option to add margins 10 char before wind width (?)
	-- vim.opt_local.textwidth
	-- print("this does work")
	--
	--
    end,
})

-- vim.api.nvim_create_autocmd("FileType",{
    --     pattern = "markdown",
    --     callback = function ()
	-- 	-- option Enabling spellcheck only for markdown files
	-- 	-- print("FIRED")
	-- 	-- vim.opt_local.spelllang ="en_us,fr"
	-- 	-- vim.opt_local.sp
	-- 	-- vim.opt_local.spelllang
	-- 	-- print("this does work")
	-- 	vim.bo.spell = true
	-- 	vim.opt_local.spelllang = { "en_us", "fr" }
	-- vim.cmd('setlocal spelllang=en_us,fr')
	--     end
	-- })
	-- 
