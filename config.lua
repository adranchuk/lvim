--[[
lvim is the global options object


Linters should be
filled in as strings with either
a global executable or a path to
an executable
]]
-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT

-- general
--
reload("adranchuk.plugins")
reload("adranchuk.keymaps")
reload("adranchuk.options")
reload("adranchuk.which-key")
reload("adranchuk.statusline")
reload("adranchuk.lsp")
reload("adranchuk.autocmds")
reload("adranchuk.set")

vim.opt.relativenumber = true
vim.opt.number = true

lvim.log.level = "warn"
lvim.format_on_save.enabled = true
lvim.format_on_save = true
-- to disable icons and use a minimalist setup, uncomment the following
-- lvim.use_icons = false

-- keymappings [view all the defaults by pressing <leader>Lk]
-- unmap a default keymapping
-- vim.keymap.del("n", "<C-Up>")
-- override a default keymapping
-- lvim.keys.normal_mode["<C-q>"] = ":q<cr>" -- or vim.keymap.set("n", "<C-q>", ":q<cr>" )

-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
-- we use protected-mode (pcall) just in case the plugin wasn't loaded yet.
-- local _, actions = pcall(require, "telescope.actions")
-- lvim.builtin.telescope.defaults.mappings = {
--   -- for input mode
--   i = {
--     ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
--     ["<C-n>"] = actions.cycle_history_next,
--     ["<C-p>"] = actions.cycle_history_prev,
--   },
--   -- for normal mode
--   n = {
--     ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
--   },
-- }

-- Change theme settings
-- lvim.builtin.theme.options.dim_inactive = true
-- lvim.builtin.theme.options.style = "nord"

-- Use which-key to add extra bindings with the leader-key prefix
-- lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
-- lvim.builtin.which_key.mappings["t"] = {
--   name = "+Trouble",
--   r = { "<cmd>Trouble lsp_references<cr>", "References" },
--   f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
--   d = { "<cmd>Trouble document_diagnostics<cr>", "Diagnostics" },
--   q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
--   l = { "<cmd>Trouble loclist<cr>", "LocationList" },
--   w = { "<cmd>Trouble workspace_diagnostics<cr>", "Workspace Diagnostics" },
-- }

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
-- lvim.builtin.alpha.active = true
-- lvim.builtin.alpha.mode = "dashboard"
-- lvim.builtin.terminal.active = true
-- lvim.builtin.nvimtree.setup.view.side = "left"
-- lvim.builtin.nvimtree.setup.renderer.icons.show.git = false

-- if you don't want all the parsers change this to a table of the ones you want
-- lvim.builtin.treesitter.ensure_installed = {
--   "bash",
--   "javascript",
--   "json",
--   "lua",
--   "python",
--   "typescript",
--   "tsx",
--   "css",
--   "rust",
--   "yaml",
--   "go",
--   "toml"
-- }

-- lvim.builtin.treesitter.ignore_install = { "haskell" }
-- lvim.builtin.treesitter.highlight.enable = true

-- -- generic LSP settings

-- -- -- make sure server will always be installed even if the server is in skipped_servers list
-- lvim.lsp.installer.setup.ensure_installed = {
--   "sumneko_lua",
--   "jsonls",
--   "gopls",
-- }
-- -- -- change UI setting of `LspInstallInfo`
-- -- -- see <https://github.com/williamboman/nvim-lsp-installer#default-configuration>
-- -- lvim.lsp.installer.setup.ui.check_outdated_servers_on_open = false
-- -- lvim.lsp.installer.setup.ui.border = "rounded"
-- -- lvim.lsp.installer.setup.ui.keymaps = {
-- --     uninstall_server = "d",
-- --     toggle_server_expand = "o",
-- -- }

-- -- ---@usage disable automatic installation of servers
-- -- lvim.lsp.installer.setup.automatic_installation = false

-- -- ---configure a server manually. !!Requires `:LvimCacheReset` to take effect!!
-- -- ---see the full default list `:lua print(vim.inspect(lvim.lsp.automatic_configuration.skipped_servers))`
-- -- vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "pyright" })
-- -- local opts = {} -- check the lspconfig documentation for a list of all possible options
-- -- require("lvim.lsp.manager").setup("pyright", opts)

-- -- ---remove a server from the skipped list, e.g. eslint, or emmet_ls. !!Requires `:LvimCacheReset` to take effect!!
-- -- ---`:LvimInfo` lists which server(s) are skipped for the current filetype
-- -- lvim.lsp.automatic_configuration.skipped_servers = vim.tbl_filter(function(server)
-- --   return server ~= "emmet_ls"
-- -- end, lvim.lsp.automatic_configuration.skipped_servers)

-- -- -- you can set a custom on_attach function that will be used for all the language servers
-- -- -- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- -- lvim.lsp.on_attach_callback = function(client, bufnr)
-- --   local function buf_set_option(...)
-- --     vim.api.nvim_buf_set_option(bufnr, ...)
-- --   end
-- --   --Enable completion triggered by <c-x><c-o>
-- --   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- -- end

-- vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "gopls", "rust_analyzer" })

-- local mason_path = vim.fn.glob(vim.fn.stdpath "data" .. "/mason/")
-- local codelldb_adapter = {
--   type = "server",
--   port = "${port}",
--   executable = {
--     command = mason_path .. "bin/codelldb",
--     args = { "--port", "${port}" },
--     -- On windows you may have to uncomment this:
--     -- detached = false,
--   },
-- }

-- pcall(function()
--   require("rust-tools").setup {
--     tools = {
--       executor = require("rust-tools/executors").termopen, -- can be quickfix or termopen
--       reload_workspace_from_cargo_toml = true,
--       runnables = {
--         use_telescope = true,
--       },
--       inlay_hints = {
--         auto = true,
--         only_current_line = false,
--         show_parameter_hints = false,
--         parameter_hints_prefix = "<-",
--         other_hints_prefix = "=>",
--         max_len_align = false,
--         max_len_align_padding = 1,
--         right_align = false,
--         right_align_padding = 7,
--         highlight = "Comment",
--       },
--       hover_actions = {
--         border = "rounded",
--       },
--       on_initialized = function()
--         vim.api.nvim_create_autocmd({ "BufWritePost", "BufEnter", "CursorHold", "InsertLeave" }, {
--           pattern = { "*.rs" },
--           callback = function()
--             local _, _ = pcall(vim.lsp.codelens.refresh)
--           end,
--         })
--       end,
--     },
--     dap = {
--       adapter = codelldb_adapter,
--     },
--     server = {
--       on_attach = function(client, bufnr)
--         require("lvim.lsp").common_on_attach(client, bufnr)
--         local rt = require "rust-tools"
--         vim.keymap.set("n", "K", rt.hover_actions.hover_actions, { buffer = bufnr })
--       end,
--       capabilities = require("lvim.lsp").common_capabilities(),
--       settings = {
--         ["rust-analyzer"] = {
--           lens = {
--             enable = true,
--           },
--           checkOnSave = {
--             enable = true,
--             command = "clippy",
--           },
--         },
--       },
--     },
--   }
-- end)

-- lvim.builtin.dap.on_config_done = function(dap)
--   dap.adapters.codelldb = codelldb_adapter
--   dap.configurations.rust = {
--     {
--       name = "Launch file",
--       type = "codelldb",
--       request = "launch",
--       program = function()
--         return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
--       end,
--       cwd = "${workspaceFolder}",
--       stopOnEntry = false,
--     },
--   }
-- end

-- vim.api.nvim_set_keymap("n", "<m-d>", "<cmd>RustOpenExternalDocs<Cr>", { noremap = true, silent = true })

-- lvim.builtin.which_key.mappings["R"] = {
--   name = "Rust",
--   r = { "<cmd>RustRunnables<Cr>", "Runnables" },
--   t = { "<cmd>lua _CARGO_TEST()<cr>", "Cargo Test" },
--   m = { "<cmd>RustExpandMacro<Cr>", "Expand Macro" },
--   c = { "<cmd>RustOpenCargo<Cr>", "Open Cargo" },
--   p = { "<cmd>RustParentModule<Cr>", "Parent Module" },
--   d = { "<cmd>RustDebuggables<Cr>", "Debuggables" },
--   v = { "<cmd>RustViewCrateGraph<Cr>", "View Crate Graph" },
--   R = {
--     "<cmd>lua require('rust-tools/workspace_refresh')._reload_workspace_from_cargo_toml()<Cr>",
--     "Reload Workspace",
--   },
--   o = { "<cmd>RustOpenExternalDocs<Cr>", "Open External Docs" },
--   y = { "<cmd>lua require'crates'.open_repository()<cr>", "[crates] open repository" },
--   P = { "<cmd>lua require'crates'.show_popup()<cr>", "[crates] show popup" },
--   i = { "<cmd>lua require'crates'.show_crate_popup()<cr>", "[crates] show info" },
--   f = { "<cmd>lua require'crates'.show_features_popup()<cr>", "[crates] show features" },
--   D = { "<cmd>lua require'crates'.show_dependencies_popup()<cr>", "[crates] show dependencies" },
-- }

-- local lsp_manager = require "lvim.lsp.manager"
-- lsp_manager.setup("golangci_lint_ls", {
--   on_init = require("lvim.lsp").common_on_init,
--   capabilities = require("lvim.lsp").common_capabilities(),
-- })

-- lsp_manager.setup("gopls", {
--   on_attach = function(client, bufnr)
--     require("lvim.lsp").common_on_attach(client, bufnr)
--     local _, _ = pcall(vim.lsp.codelens.refresh)
--     local map = function(mode, lhs, rhs, desc)
--       if desc then
--         desc = desc
--       end

--       vim.keymap.set(mode, lhs, rhs, { silent = true, desc = desc, buffer = bufnr, noremap = true })
--     end
--     map("n", "<leader>Ci", "<cmd>GoInstallDeps<Cr>", "Install Go Dependencies")
--     map("n", "<leader>Ct", "<cmd>GoMod tidy<cr>", "Tidy")
--     map("n", "<leader>Ca", "<cmd>GoTestAdd<Cr>", "Add Test")
--     map("n", "<leader>CA", "<cmd>GoTestsAll<Cr>", "Add All Tests")
--     map("n", "<leader>Ce", "<cmd>GoTestsExp<Cr>", "Add Exported Tests")
--     map("n", "<leader>Cg", "<cmd>GoGenerate<Cr>", "Go Generate")
--     map("n", "<leader>Cf", "<cmd>GoGenerate %<Cr>", "Go Generate File")
--     map("n", "<leader>Cc", "<cmd>GoCmt<Cr>", "Generate Comment")
--     map("n", "<leader>DT", "<cmd>lua require('dap-go').debug_test()<cr>", "Debug Test")
--   end,
--   on_init = require("lvim.lsp").common_on_init,
--   capabilities = require("lvim.lsp").common_capabilities(),
--   settings = {
--     gopls = {
--       usePlaceholders = true,
--       gofumpt = true,
--       codelenses = {
--         generate = false,
--         gc_details = true,
--         test = true,
--         tidy = true,
--       },
--     },
--   },
-- })

-- local status_ok, gopher = pcall(require, "gopher")
-- if not status_ok then
--   return
-- end

-- gopher.setup {
--   commands = {
--     go = "go",
--     gomodifytags = "gomodifytags",
--     gotests = "gotests",
--     impl = "impl",
--     iferr = "iferr",
--   },
-- }

-- -- -- set a formatter, this will override the language server formatting capabilities (if it exists)
-- local formatters = require "lvim.lsp.null-ls.formatters"
-- formatters.setup {
--   { command = "stylua", filetypes = { "lua " } },
--   { command = "black",  filetypes = { "python" } },
--   { command = "isort",  filetypes = { "python" } },
--   {
--     -- each formatter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
--     command = "prettier",
--     ---@usage arguments to pass to the formatter
--     -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
--     extra_args = { "--print-with", "100" },
--     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
--     filetypes = { "typescript", "typescriptreact" },
--   },
--   { command = "goimports", filetypes = { "go" } },
--   { command = "gofumpt",   filetypes = { "go" } },
-- }

-- -- -- set additional linters
-- local linters = require "lvim.lsp.null-ls.linters"
-- linters.setup {
--   { command = "golangci_lint", filetypes = { "golang" } },
--   --   { command = "flake8", filetypes = { "python" } },
--   --   {
--   --     -- each linter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
--   --     command = "shellcheck",
--   --     ---@usage arguments to pass to the formatter
--   --     -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
--   --     extra_args = { "--severity", "warning" },
--   --   },
--   --   {
--   --     command = "codespell",
--   --     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
--   --     filetypes = { "javascript", "python" },
--   --   },
-- }

-- -- Additional Plugins

-- -- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- -- vim.api.nvim_create_autocmd("BufEnter", {
-- --   pattern = { "*.go" },
-- --   command = "gofmt",
-- -- })
-- -- vim.api.nvim_create_autocmd("FileType", {
-- --   pattern = "zsh",
-- --   callback = function()
-- --     -- let treesitter use bash highlight for zsh files as well
-- --     require("nvim-treesitter.highlight").attach(0, "bash")
-- --   end,
-- -- })
