lvim.plugins = {
	{
		"folke/trouble.nvim",
		cmd = "TroubleToggle",
	},
	{
		"wakatime/vim-wakatime",
	},

	{
		"folke/todo-comments.nvim",
		event = "BufRead",
		config = function()
			require("todo-comments").setup()
		end,
	},
	{
		"folke/persistence.nvim",
		event = "BufReadPre",
		config = function()
			require("persistence").setup({
				dir = vim.fn.expand(vim.fn.stdpath("state") .. "/sessions/"),
				options = { "buffers", "curdir", "tabpages", "winsize" },
			})
		end,
	},
	"onsails/lspkind.nvim",
	"simrat39/rust-tools.nvim",
	"neovim/nvim-lspconfig",
	"hrsh7th/cmp-nvim",
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/cmp-vsnip",
	"hrsh7th/cmp-path",
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-nvim-lua",
	"hrsh7th/cmp-nvim-lsp-signature-help",
	{ "christoomey/vim-tmux-navigator" },
	{ "tpope/vim-surround" },
	{ "ThePrimeagen/harpoon" },
	{
		"NeogitOrg/neogit",
		dependencies = {
			"nvim-lua/plenary.nvim", -- required
			"nvim-telescope/telescope.nvim", -- optional
			"sindrets/diffview.nvim", -- optional
		},
		config = true,
	},
	{
		"tzachar/cmp-tabnine",
		build = "./install.sh",
		dependencies = {
			"hrsh7th/nvim-cmp",
		},
		event = "InsertEnter",
	},
	{
		"olexsmir/gopher.nvim",
	},
	{
		"phaazon/hop.nvim",
		branch = "v2",
		config = function()
			require("hop").setup()
		end,
	},
	{
		"puremourning/vimspector",
	},
	{
		"saecki/crates.nvim",
		version = "v0.3.0",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("crates").setup({
				null_ls = {
					enabled = true,
					name = "crates.nvim",
				},
				popup = {
					border = "rounded",
				},
			})
		end,
	},
	-- {
	-- 	"nvim-telescope/telescope-frecency.nvim",
	-- 	dependencies = { "nvim-telescope/telescope.nvim", "kkharji/sqlite.lua" },
	-- },
	{
		"NeogitOrg/neogit",
		dependencies = {
			"nvim-lua/plenary.nvim", -- required
			"nvim-telescope/telescope.nvim", -- optional
			"sindrets/diffview.nvim", -- optional
			"ibhagwan/fzf-lua", -- optional
		},
		config = true,
	},
}

-- lvim.builtin.telescope.on_config_done = function(telescope)
-- 	pcall(telescope.load_extension, "frecency")
-- end

local neogit = require("neogit")

neogit.setup({
	-- Hides the hints at the top of the status buffer
	disable_hint = false,
	-- Disables changing the buffer highlights based on where the cursor is.
	disable_context_highlighting = false,
	-- Disables signs for sections/items/hunks
	disable_signs = false,
	-- Do not ask to confirm the commit - just do it when the buffer is closed.
	disable_commit_confirmation = false,
	-- Uses `vim.notify` instead of the built-in notification system.
	disable_builtin_notifications = false,
	-- Changes what mode the Commit Editor starts in. `true` will leave nvim in normal mode, `false` will change nvim to
	-- insert mode, and `"auto"` will change nvim to insert mode IF the commit message is empty, otherwise leaving it in
	-- normal mode.
	disable_insert_on_commit = true,
	-- When enabled, will watch the `.git/` directory for changes and refresh the status buffer in response to filesystem
	-- events.
	filewatcher = {
		interval = 1000,
		enabled = true,
	},
	-- Allows a different telescope sorter. Defaults to 'fuzzy_with_index_bias'. The example below will use the native fzf
	-- sorter instead. By default, this function returns `nil`.
	telescope_sorter = function()
		return require("telescope").extensions.fzf.native_fzf_sorter()
	end,
	-- Persist the values of switches/options within and across sessions
	remember_settings = true,
	-- Scope persisted settings on a per-project basis
	use_per_project_settings = true,
	-- Table of settings to never persist. Uses format "Filetype--cli-value"
	ignored_settings = {
		"NeogitPushPopup--force-with-lease",
		"NeogitPushPopup--force",
		"NeogitPullPopup--rebase",
		"NeogitCommitPopup--allow-empty",
		"NeogitRevertPopup--no-edit",
	},
	-- Neogit refreshes its internal state after specific events, which can be expensive depending on the repository size.
	-- Disabling `auto_refresh` will make it so you have to manually refresh the status after you open it.
	auto_refresh = true,
	-- Value used for `--sort` option for `git branch` command
	-- By default, branches will be sorted by commit date descending
	-- Flag description: https://git-scm.com/docs/git-branch#Documentation/git-branch.txt---sortltkeygt
	-- Sorting keys: https://git-scm.com/docs/git-for-each-ref#_options
	sort_branches = "-committerdate",
	-- Change the default way of opening neogit
	kind = "tab",
	-- The time after which an output console is shown for slow running commands
	console_timeout = 2000,
	-- Automatically show console if a command takes more than console_timeout milliseconds
	auto_show_console = true,
	status = {
		recent_commit_count = 10,
	},
	commit_editor = {
		kind = "split",
	},
	commit_select_view = {
		kind = "tab",
	},
	commit_view = {
		kind = "vsplit",
		verify_commit = os.execute("which gpg") == 0, -- Can be set to true or false, otherwise we try to find the binary
	},
	log_view = {
		kind = "tab",
	},
	rebase_editor = {
		kind = "split",
	},
	reflog_view = {
		kind = "tab",
	},
	merge_editor = {
		kind = "split",
	},
	preview_buffer = {
		kind = "split",
	},
	popup = {
		kind = "split",
	},
	signs = {
		-- { CLOSED, OPENED }
		hunk = { "", "" },
		item = { ">", "v" },
		section = { ">", "v" },
	},
	-- Each Integration is auto-detected through plugin presence, however, it can be disabled by setting to `false`
	integrations = {
		-- If enabled, use telescope for menu selection rather than vim.ui.select.
		-- Allows multi-select and some things that vim.ui.select doesn't.
		telescope = nil,
		-- Neogit only provides inline diffs. If you want a more traditional way to look at diffs, you can use `diffview`.
		-- The diffview integration enables the diff popup.
		--
		-- Requires you to have `sindrets/diffview.nvim` installed.
		diffview = nil,

		-- If enabled, uses fzf-lua for menu selection. If the telescope integration
		-- is also selected then telescope is used instead
		-- Requires you to have `ibhagwan/fzf-lua` installed.
		fzf_lua = nil,
	},
	sections = {
		-- Reverting/Cherry Picking
		sequencer = {
			folded = false,
			hidden = false,
		},
		untracked = {
			folded = false,
			hidden = false,
		},
		unstaged = {
			folded = false,
			hidden = false,
		},
		staged = {
			folded = false,
			hidden = false,
		},
		stashes = {
			folded = true,
			hidden = false,
		},
		unpulled_upstream = {
			folded = true,
			hidden = false,
		},
		unmerged_upstream = {
			folded = false,
			hidden = false,
		},
		unpulled_pushRemote = {
			folded = true,
			hidden = false,
		},
		unmerged_pushRemote = {
			folded = false,
			hidden = false,
		},
		recent = {
			folded = true,
			hidden = false,
		},
		rebase = {
			folded = true,
			hidden = false,
		},
	},
	mappings = {
		finder = {
			["<cr>"] = "Select",
			["<c-c>"] = "Close",
			["<esc>"] = "Close",
			["<c-n>"] = "Next",
			["<c-p>"] = "Previous",
			["<down>"] = "Next",
			["<up>"] = "Previous",
			["<tab>"] = "MultiselectToggleNext",
			["<s-tab>"] = "MultiselectTogglePrevious",
			["<c-j>"] = "NOP",
		},
		-- Setting any of these to `false` will disable the mapping.
		status = {
			["q"] = "Close",
			["I"] = "InitRepo",
			["1"] = "Depth1",
			["2"] = "Depth2",
			["3"] = "Depth3",
			["4"] = "Depth4",
			["<tab>"] = "Toggle",
			["x"] = "Discard",
			["s"] = "Stage",
			["S"] = "StageUnstaged",
			["<c-s>"] = "StageAll",
			["u"] = "Unstage",
			["U"] = "UnstageStaged",
			["d"] = "DiffAtFile",
			["$"] = "CommandHistory",
			["#"] = "Console",
			["<c-r>"] = "RefreshBuffer",
			["<enter>"] = "GoToFile",
			["<c-v>"] = "VSplitOpen",
			["<c-x>"] = "SplitOpen",
			["<c-t>"] = "TabOpen",
			["?"] = "HelpPopup",
			["D"] = "DiffPopup",
			["p"] = "PullPopup",
			["r"] = "RebasePopup",
			["m"] = "MergePopup",
			["P"] = "PushPopup",
			["c"] = "CommitPopup",
			["l"] = "LogPopup",
			["v"] = "RevertPopup",
			["Z"] = "StashPopup",
			["A"] = "CherryPickPopup",
			["b"] = "BranchPopup",
			["f"] = "FetchPopup",
			["X"] = "ResetPopup",
			["M"] = "RemotePopup",
			["{"] = "GoToPreviousHunkHeader",
			["}"] = "GoToNextHunkHeader",
		},
	},
})

local tabnine = require("cmp_tabnine.config")

tabnine:setup({
	max_lines = 1000,
	max_num_results = 20,
	sort = true,
	run_on_every_keystroke = true,
	snippet_placeholder = "..",
	ignored_file_types = {
		-- default is not to ignore
		-- uncomment to ignore in lua:
		-- lua = true
	},
	show_prediction_strength = false,
})

-- local lspkind = require("lspkind")

-- local source_mapping = {
-- 	buffer = "[Buffer]",
-- 	nvim_lsp = "[LSP]",
-- 	nvim_lua = "[Lua]",
-- 	cmp_tabnine = "[TN]",
-- 	path = "[Path]",
-- }
local cmp = require("cmp")
local lspkind = require("lspkind")
cmp.setup({
	sources = {
		{ name = "cmp_tabnine" },
	},
	formatting = {
		format = function(entry, vim_item)
			-- if you have lspkind installed, you can use it like
			-- in the following line:
			vim_item.kind = lspkind.symbolic(vim_item.kind, { mode = "symbol" })
			vim_item.menu = source_mapping[entry.source.name]
			if entry.source.name == "cmp_tabnine" then
				local detail = (entry.completion_item.labelDetails or {}).detail
				vim_item.kind = ""
				if detail and detail:find(".*%%.*") then
					vim_item.kind = vim_item.kind .. " " .. detail
				end

				if (entry.completion_item.data or {}).multiline then
					vim_item.kind = vim_item.kind .. " " .. "[ML]"
				end
			end
			local maxwidth = 80
			vim_item.abbr = string.sub(vim_item.abbr, 1, maxwidth)
			return vim_item
		end,
	},
})
