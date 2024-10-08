require("mason").setup({
	automatic_installation = true,
})
require("mason-lspconfig").setup({
	ensure_installed = {},
	handlers = {
		function(server_name)
			require("lspconfig")[server_name].setup({})
		end,
	},
})

-- Set up nvim-cmp.
local cmp = require("cmp")

cmp.setup({
	window = {
		-- completion = cmp.config.window.bordered(),
		-- documentation = cmp.config.window.bordered(),
	},
	mapping = cmp.mapping.preset.insert({
		["<C-j>"] = cmp.mapping.select_next_item(),
		["<C-k>"] = cmp.mapping.select_prev_item(),
		["<C-.>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.abort(),
		["<Enter>"] = cmp.mapping.confirm({ select = true }), -- Accept currently
		-- selected item. Set `select` to `false` to only confirm explicitly selected items.
	}),
	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		-- { name = 'luasnip' }, -- For luasnip users.
		-- { name = 'ultisnips' }, -- For ultisnips users.
		-- { name = 'snippy' }, -- For snippy users.
	}, {
		{ name = "buffer" },
	}),
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ "/", "?" }, {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = "buffer" },
	},
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(":", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = "path" },
	}, {
		{ name = "cmdline" },
	}),
	matching = { disallow_symbol_nonprefix_matching = false },
})

local capabilities = require("cmp_nvim_lsp").default_capabilities()

require("lspconfig").gleam.setup({})
require("lspconfig")["biome"].setup({
	capabilities = capabilities,
})
require("lspconfig")["rust_analyzer"].setup({
	capabilities = capabilities,
})
require("lspconfig")["ruff"].setup({
	capabilities = capabilities,
})
require("lspconfig")["gopls"].setup({
	capabilities = capabilities,
})
require("lspconfig")["pyright"].setup({
	capabilities = capabilities,
})
require("lspconfig")["lua_ls"].setup({
	capabilities = capabilities,
	settings = {
		Lua = {
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true),
			},
		},
	},
})
