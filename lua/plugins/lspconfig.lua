return {
	"neovim/nvim-lspconfig",
	config = function()
		-- Setup language servers.
		local lspconfig = require("lspconfig")

		-- Python
    lspconfig.ruff.setup({
      settings = {
        args = {}
      }
    })

		-- C/C++
		lspconfig.clangd.setup({
			cmd = { "clangd", "--background-index", "--clang-tidy" },
		})

		-- Rust
		lspconfig.rust_analyzer.setup({
			on_attach = function(client, bufnr)
        local opts = { buffer = bufnr }
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', '<leader>r', vim.lsp.buf.rename, opts)
      end,
      settings = {
				["rust-analyzer"] = {
					checkOnSave = { command = "clippy" },
					cargo = { allFeatures = true },
				},
			},
		})

		-- Lua
		lspconfig.lua_ls.setup({
			settings = {
				Lua = {
					runtime = { version = "LuaJIT" },
					diagnostics = { globals = { "vim" } },
					workspace = {
						library = vim.api.nvim_get_runtime_file("", true),
						checkThirdParty = false,
					},
					telemetry = { enable = false },
				},
			},
		})

		-- Emmet (for web development)
		lspconfig.emmet_language_server.setup({
			filetypes = {
				"css", "svelte", "eruby", "html", "javascript",
				"javascriptreact", "less", "sass", "scss", "pug", "typescriptreact",
			},
			init_options = {
				showAbbreviationSuggestions = true,
				showExpandedAbbreviation = "always",
				showSuggestionsAsSnippets = false,
			},
		})

		-- Svelte & TailwindCSS (for frontend development)
		lspconfig.svelte.setup({})
		lspconfig.tailwindcss.setup({})

		-- Global diagnostics keymaps
		vim.keymap.set("n", "<leader>dp", vim.diagnostic.goto_prev, { desc = "Previous diagnostic" })
		vim.keymap.set("n", "<leader>dn", vim.diagnostic.goto_next, { desc = "Next diagnostic" })
		vim.keymap.set("n", "<space>df", vim.diagnostic.open_float, { desc = "Show diagnostics" })
		vim.keymap.set("n", "<space>dl", vim.diagnostic.setloclist, { desc = "Diagnostics list" })

		-- LSP Keybindings (Attach to LSP when active)
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(ev)
				local opts = { buffer = ev.buf }
				vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
				vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
				vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
				vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
				vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, opts)
				vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
				vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, opts)
				vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
				vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
				vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts)
				vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, opts)
				vim.keymap.set("n", "<space>wl", function()
					print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
				end, opts)

				-- Formatting (Python uses Ruff, others use default LSP formatting)
				vim.keymap.set("n", "<space>f", function()
					vim.lsp.buf.format({
						async = true,
						filter = function(client)
							return client.name ~= "ruff_lsp"
						end,
					})
				end, opts)
			end,
		})
	end,
}
