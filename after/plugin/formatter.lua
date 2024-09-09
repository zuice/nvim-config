local util = require("formatter.util")
local biome_formats = {
	"javascript",
	"typescript",
	"json",
	"javascriptreact",
	"typescriptreact",
	"astro",
}

local filetype = {
	gleam = {
		function()
			return {
				exe = "gleam",
				args = { "format", util.escape_path(util.get_current_buffer_file_path()) },
				stdin = true,
			}
		end,
	},
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
}

for _, ft in ipairs(biome_formats) do
	filetype[ft] = {
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
	}
end

require("formatter").setup({
	logging = true,
	log_level = vim.log.levels.WARN,
	filetype = filetype,
})

-- Format on save
vim.api.nvim_create_augroup("__formatter__", { clear = true })
vim.api.nvim_create_autocmd("BufWritePost", {
	group = "__formatter__",
	command = ":FormatWrite",
})
