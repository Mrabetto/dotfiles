-- TODO please add keybinds for moving line bellow or above 
vim.g.mapleader= " "
-- vim.keymaps
vim.keymap.set({'n','v'}, '<leader>/', 'gcc', { desc = 'Comment line' })
vim.keymap.set("n", "<leader>w", "<cmd>w<CR>", { desc = "Save file" })
vim.keymap.set("n", "<leader>q", "<cmd>conf q<CR>", { desc = "Quit neovim (confirm quit)" })
vim.keymap.set("n", "<leader>vsp", "<cmd>vsp<CR>", { desc = "Vertical split" })
vim.keymap.set("n", "<leader>sp", "<cmd>sp<CR>", { desc = "Normal split" })
vim.keymap.set("n", "<leader>/", "gcc", { remap = true, desc = "Comment line" })
vim.keymap.set("v", "<leader>/", "gc",  { remap = true, desc = "Comment selection" })
vim.keymap.set("n", "<leader>l", "<cmd>Lazy<CR>", { desc = "Lazy menu" })
vim.keymap.set("n", "<leader>e", "<cmd>lua MiniFiles.open()<CR>", { desc = "Open file explorer" })
--tab keybinds
vim.keymap.set("n", "<leader>t", ":tabnew<CR>", { desc = "Open a new tab" })
vim.keymap.set({"n","v"},"<leader><Tab>","<cmd>tabnext<CR>",{desc="Tab next"})
vim.keymap.set({"n","v"},"<S-Tab>","<cmd>tabprev<CR>",{desc="Tab next"})

-- keys for navigating windows within a tab/buffer(?)
-- Now deprecated since I use tmux
-- vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Window movement test" })
-- vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Window movement test" })
-- vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Window movement test" })
-- vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Window movement test" })

-- moving lines up and down
vim.keymap.set({'n'},'<A-j>',"<cmd>move +1<CR>",{desc = "move line down"})
vim.keymap.set({'n'},'<A-k>',"<cmd>move -2<CR>",{desc = "move line up"})
-- now for visual mode 
vim.keymap.set({'v'},'<A-j>',":m '>+1<CR>gv",{desc = "move line down in visual mode without indentation"})
vim.keymap.set({'v'},'<A-k>',":m '<-2<CR>gv",{desc = "move line up in visual mode without indentation"})

-- delete single character without copying into register
vim.keymap.set('n', 'x', '"_x')


-- Shortcut for searching your Neovim configuration files

local builtin = require 'telescope.builtin'
vim.keymap.set('n', '<leader>fn', function() builtin.find_files { cwd = vim.fn.stdpath 'config' } end,
{ desc = '[S]earch [N]eovim files' })




local actions = require('telescope.actions')
local action_state = require('telescope.actions.state')

vim.keymap.set('n', '<leader>ft', function()
  builtin.colorscheme({
    attach_mappings = function(_, map)
      map('i', '<CR>', function(prompt_bufnr)
        local selection = action_state.get_selected_entry()
        actions.close(prompt_bufnr)

        local scheme = selection.value
        vim.cmd.colorscheme(scheme)

        -- save permanently
        local path = vim.fn.stdpath("config") .. "/lua/config/colorscheme.lua"
        local file = io.open(path, "w")
        file:write('vim.cmd.colorscheme("' .. scheme .. '")')
        file:close()

        print("Saved colorscheme: " .. scheme)
      end)
      return true
    end,
  })
end,  { desc = "Select colorscheme" })


-- keymap to empty to the search register
vim.keymap.set('n', '<leader>cl', ":nohl<CR>")



-- keybinds for moving cursor down (multiline text) only of markdown 
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "markdown", "text", "gitcommit" },
    callback = function(args)
        vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", {
            buffer = args.buf,
            expr = true,
        })
        vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", {
            buffer = args.buf,
            expr = true,
        })
    end,
})


-- trigger spell checker and cycle through the remaining errors inside buffer 
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

vim.api.nvim_create_autocmd("FileType",{
    pattern = "odin",
    callback = function ()
	vim.keymap.set("n","<leader>or","<cmd>!odin run . -debug<CR>",{desc = "odin run"})
	vim.keymap.set("n","<leader>ob","<cmd>!odin build . -debug<CR>",{desc = "odin build"})
	vim.keymap.set("n","<leader>of","<cmd>!odin fmt . -debug<CR>",{desc = "odin fmt"})
    end,
}
)
