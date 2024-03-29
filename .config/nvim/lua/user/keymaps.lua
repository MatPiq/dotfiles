-- Shorten function name
local keymap = vim.keymap.set
-- Silent keymap option
local opts = { silent = true }

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "

--Save and quit with leader
keymap("n", "<leader>w", ":w<CR>", opts)
keymap("n", "<leader>q", ":q<CR>", opts)
keymap("n", "<leader>wq", ":wq<CR>", opts)
keymap("n", "<leader>wQ", ":wq!<CR>", opts)

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Clear highlights
keymap("n", "<leader>h", "<cmd>nohlsearch<CR>", opts)

-- Close buffers
keymap("n", "<leader>bk", "<cmd>Bdelete!<CR>", opts)

-- Better paste
keymap("v", "p", '"_dP', opts)

-- move line / block of text with Alt-j/k
keymap("n", "<A-j>", ":m .+1<CR>==", opts)
keymap("n", "<A-k>", ":m .-2<CR>==", opts)

-- Insert --
-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)

-- move line / block of text with Alt-j/k
keymap("i", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
keymap("i", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)
-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move line or code block with j and k
keymap("v", "J", ":move '>+1<CR>gv-gv", opts)
keymap("v", "K", ":move '<-2<CR>gv-gv", opts)

-- Plugins --

-- alpha
keymap("n", "<leader>a", "<cmd>Alpha<CR>", opts)

-- NvimTree
keymap("n", "<leader>e", ":NvimTreeToggle<CR>", opts)

-- Terminal
keymap("n", "<leader>tb", "<cmd>ToggleTerm direction=tab<cr>", opts)
keymap("n", "<leader>tf", "<cmd>ToggleTerm direction=float<cr>", opts)
keymap("n", "<leader>th", "<cmd>ToggleTerm size=10 direction=horizontal<cr>", opts)
keymap("n", "<leader>tv", "<cmd>ToggleTerm size=80 direction=vertical<cr>", opts)

-- Telescope
keymap("n", "<leader>ff", ":Telescope find_files<CR>", opts)
keymap("n", "<leader>ft", ":Telescope live_grep<CR>", opts)
keymap("n", "<leader>fp", ":Telescope projects<CR>", opts)
keymap("n", "<leader>fb", ":Telescope buffers<CR>", opts)
keymap("n", "<leader>fr", ":Telescope oldfiles<CR>", opts)
keymap("n", "<leader>fc", ":Telescope colorscheme<CR>", opts)
keymap("n", "<leader>fm", ":Telescope man_pages<CR>", opts)
keymap("n", "<leader>fk", ":Telescope keymaps<CR>", opts)

-- Telescope LSP
keymap("n", "<leader>fs", ":Telescope lsp_document_symbols<CR>", opts)
keymap("n", "<leader>fS", ":Telescope lsp_dynamic_workspace_symbols<CR>", opts)
keymap("n", "<leader>fd", ":Telescope diagnostics<CR>", opts)

-- Git
keymap("n", "<leader>gg", "<cmd>lua _LAZYGIT_TOGGLE()<CR>", opts)
keymap("n", "<leader>gc", ":Telescope git_commits<CR>", opts)
keymap("n", "<leader>gs", ":Telescope git_status<CR>", opts)
keymap("n", "<leader>gb", ":Telescope git_branches<CR>", opts)

keymap("n", "<leader>ce", ":Copilot enable<CR>", opts)
keymap("n", "<leader>cd", ":Copilot disable<CR>", opts)
keymap("n", "<leader>cp", ":Copilot panel<CR>", opts)

-- Run files
local nore_silent = { noremap = true, silent = true }
vim.keymap.set("n", "<leader>tr", "<cmd>lua _RUN_FILE()<CR>", nore_silent)

-- Ipython
keymap("n", "<leader>tp", "<cmd>lua _IPYTHON_TOGGLE()<CR>", opts)

-- Send lines to terminal
keymap("n", "<leader>s", "ToggleTermSendCurrentLine:CR>", opts)
keymap("v", "<leader>s", "ToggleTermSendVisualSelection:CR>", opts)

-- Spotify
keymap("n", "<leader>ts", "<cmd>lua _SPOTIFY_TOGGLE()<CR>", opts)

-- Comment
keymap("n", "<leader>/", "<cmd>lua require('Comment.api').toggle_current_linewise()<CR>", opts)
keymap("x", "<leader>/", '<ESC><CMD>lua require("Comment.api").toggle_linewise_op(vim.fn.visualmode())<CR>')

-- DAP
keymap("n", "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", opts)
keymap("n", "<leader>dc", "<cmd>lua require'dap'.continue()<cr>", opts)
keymap("n", "<leader>di", "<cmd>lua require'dap'.step_into()<cr>", opts)
keymap("n", "<leader>do", "<cmd>lua require'dap'.step_over()<cr>", opts)
keymap("n", "<leader>dO", "<cmd>lua require'dap'.step_out()<cr>", opts)
keymap("n", "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>", opts)
keymap("n", "<leader>dl", "<cmd>lua require'dap'.run_last()<cr>", opts)
keymap("n", "<leader>du", "<cmd>lua require'dapui'.toggle()<cr>", opts)
keymap("n", "<leader>dt", "<cmd>lua require'dap'.terminate()<cr>", opts)

-- manpage shit word under buffer with added cppman
keymap("n", "<leader>M", "<cmd>JbzCppMan<cr>", opts)
