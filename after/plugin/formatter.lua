local util = require("formatter.util")

require("formatter").setup({
	logging = true,
	log_level = vim.log.levels.WARN,
	filetype = {
		lua = {
			require("formatter.filetypes.lua").stylua,
			function()
				if util.get_current_buffer_file_name() == "special.lua" then
					return nil
				end
				return {
					exe = "stylua",
					args = {
						"--search-parent-directories",
						"--stdin-filepath",
						util.escape_path(util.get_current_buffer_file_path()),
						"--",
						"-",
					},
					stdin = true,
				}
			end,
		},
		go = {
			function()
				return {
					exe = "gofmt",
					args = { util.escape_path(util.get_current_buffer_file_path()) },
					stdin = true,
				}
			end,
		},
		javascript = {
			function()
				return {
					exe = "biome",
					args = {
						"format",
						"--stdin-file-path",
						util.escape_path(util.get_current_buffer_file_path()),
					},
					stdin = true,
				}
			end,
		},
		typescript = {
			function()
				return {
					exe = "biome",
					args = {
						"format",
						"--stdin-file-path",
						util.escape_path(util.get_current_buffer_file_path()),
					},
					stdin = true,
				}
			end,
		},
		typescriptreact = { -- Change 'tsx' to 'typescriptreact'
			function()
				return {
					exe = "biome",
					args = {
						"format",
						"--stdin-file-path",
						util.escape_path(util.get_current_buffer_file_path()),
					},
					stdin = true,
				}
			end,
		},
		astro = { -- Add support for Astro files
			function()
				return {
					exe = "prettier",
					args = {
						"--stdin-filepath",
						util.escape_path(util.get_current_buffer_file_path()),
						"--parser",
						"astro",
					},
					stdin = true,
				}
			end,
		},
		python = {
			function()
				return {
					exe = "ruff",
					args = {
						"format",
						"--stdin-filename",
						util.escape_path(util.get_current_buffer_file_path()),
						"-",
					},
					stdin = true,
				}
			end,
		},
		["*"] = {
			require("formatter.filetypes.any").remove_trailing_whitespace,
		},
	},
})

-- Format on save
vim.api.nvim_create_augroup("__formatter__", { clear = true })
vim.api.nvim_create_autocmd("BufWritePost", {
	group = "__formatter__",
	command = ":FormatWrite",
})
