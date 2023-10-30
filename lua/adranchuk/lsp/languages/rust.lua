vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "rust_analyzer" })

pcall(function()
	require("rust-tools").setup({
		tools = {
			executor = require("rust-tools/executors").termopen, -- can be quickfix or termopen
			reload_workspace_from_cargo_toml = true,
			runnables = {
				use_telescope = true,
			},
			inlay_hints = {
				auto = true,
				only_current_line = false,
				show_parameter_hints = false,
				parameter_hints_prefix = "<-",
				other_hints_prefix = "=>",
				max_len_align = false,
				max_len_align_padding = 1,
				right_align = false,
				right_align_padding = 7,
				highlight = "Comment",
			},
			hover_actions = {
				border = "rounded",
			},
			on_initialized = function()
				vim.api.nvim_create_autocmd({ "BufWritePost", "BufEnter", "CursorHold", "InsertLeave" }, {
					pattern = { "*.rs" },
					callback = function()
						local _, _ = pcall(vim.lsp.codelens.refresh)
					end,
				})
			end,
		},
		server = {
			on_attach = function(client, bufnr)
				require("lvim.lsp").common_on_attach(client, bufnr)
				local rt = require("rust-tools")
				vim.keymap.set("n", "K", rt.hover_actions.hover_actions, { buffer = bufnr })
				vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
			end,
			capabilities = require("lvim.lsp").common_capabilities(),
			settings = {
				["rust-analyzer"] = {
					lens = {
						enable = true,
					},
					check = {
						enable = true,
						command = "clippy",
					},
				},
			},
		},
	})

	-- LSP Diagnostics Options Setup
	local sign = function(opts)
		vim.fn.sign_define(opts.name, {
			texthl = opts.name,
			text = opts.text,
			numhl = "",
		})
	end

	sign({ name = "DiagnosticSignError", text = "" })
	sign({ name = "DiagnosticSignWarn", text = "" })
	sign({ name = "DiagnosticSignHint", text = "" })
	sign({ name = "DiagnosticSignInfo", text = "" })

	vim.diagnostic.config({
		virtual_text = false,
		signs = true,
		update_in_insert = true,
		underline = true,
		severity_sort = false,
		float = {
			border = "rounded",
			source = "always",
			header = "",
			prefix = "",
		},
	})

	vim.cmd([[
set signcolumn=yes
autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })
]])
end)
