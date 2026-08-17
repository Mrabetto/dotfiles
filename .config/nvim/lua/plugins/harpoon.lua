return{
    "ThePrimeagen/harpoon",
    config = function()
	require("telescope").load_extension('harpoon')
	require("harpoon").setup()
    end
}
