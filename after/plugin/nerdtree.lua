local function manage_nerdtree_buffer()
	if
		vim.api.nvim_win_get_number(0) == vim.api.nvim_eval("winnr('h')")
		and vim.api.nvim_eval("bufname('#')"):match("NERD_tree_%d+")
		and not vim.api.nvim_eval("bufname('%')"):match("NERD_tree_%d+")
		and vim.api.nvim_eval("winnr('$')") > 1
	then
		local buf = vim.api.nvim_get_current_buf()
		vim.api.nvim_command("buffer #")
		vim.api.nvim_command("wincmd w")
		vim.api.nvim_command("execute 'buffer'." .. buf)
	end
end

local function open_nerdtree_if_not_exists()
	-- Check if NERDTree is already open
	local nerdtree_open = false
	for _, win in ipairs(vim.api.nvim_list_wins()) do
		local buf = vim.api.nvim_win_get_buf(win)
		local buf_name = vim.api.nvim_buf_get_name(buf)
		if buf_name:match("NERD_tree_%d+") then
			nerdtree_open = true
			break
		end
	end

	-- If NERDTree is not open, open it
	if not nerdtree_open then
		vim.api.nvim_command("NERDTree")
		vim.api.nvim_command("wincmd w")
	end
end

vim.api.nvim_create_autocmd({ "BufEnter" }, {
	pattern = "*",
	callback = manage_nerdtree_buffer,
})

vim.api.nvim_create_autocmd({ "VimEnter" }, {
	pattern = "*",
	callback = open_nerdtree_if_not_exists,
})
