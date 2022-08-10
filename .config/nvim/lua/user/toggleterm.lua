local status_ok, toggleterm = pcall(require, "toggleterm")
if not status_ok then
  return
end

toggleterm.setup({
  size = 20,
  open_mapping = [[<c-\>]],
  hide_numbers = true,
  shade_terminals = true,
  shading_factor = 2,
  start_in_insert = true,
  insert_mappings = true,
  persist_size = true,
  direction = "float",
  close_on_exit = true,
  shell = vim.o.shell,
  float_opts = {
    border = "curved",
  },
})

function _G.set_terminal_keymaps()
  local opts = { noremap = true }
  -- vim.api.nvim_buf_set_keymap(0, 't', '<esc>', [[<C-\><C-n>]], opts)
  vim.api.nvim_buf_set_keymap(0, "t", "<C-h>", [[<C-\><C-n><C-W>h]], opts)
  vim.api.nvim_buf_set_keymap(0, "t", "<C-j>", [[<C-\><C-n><C-W>j]], opts)
  vim.api.nvim_buf_set_keymap(0, "t", "<C-k>", [[<C-\><C-n><C-W>k]], opts)
  vim.api.nvim_buf_set_keymap(0, "t", "<C-l>", [[<C-\><C-n><C-W>l]], opts)
end

vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")

local Terminal = require("toggleterm.terminal").Terminal
local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })
local spotify = Terminal:new({ cmd = "spt", hidden = true })
local ipython = Terminal:new({ cmd = "ipython", direction = "vertical", size = 80 })

function _LAZYGIT_TOGGLE()
  lazygit:toggle()
end

function _SPOTIFY_TOGGLE()
  spotify:toggle()
end

function _IPYTHON_TOGGLE()
  ipython:toggle()
end

-- Compile and run different files
local exp = vim.fn.expand

local files = {
  python = "python3  " .. exp("%:p"),
  lua = "lua " .. exp("%:t"),
  c = "gcc -o temp " .. exp("%:t") .. " && ./temp && rm ./temp",
  cpp = "g++ --std=c++17 -o temp " .. exp("%:p") .. " && time ./temp && rm -rf temp",
  java = "javac " .. exp("%:t") .. " && java " .. exp("%:t:r") .. " && rm *.class",
  rust = "cargo run",
  javascript = "node " .. exp("%:t"),
  typescript = "tsc " .. exp("%:t") .. " && node " .. exp("%:t:r") .. ".js",
}

function _RUN_FILE()
  -- cd to the file's directory
  vim.cmd([[w]])
  vim.cmd([[luafile ~/.config/nvim/lua/user/toggleterm.lua]])
  -- sleep 0.5 before executing the file
  os.execute("sleep 0.5")

  local command = files[vim.bo.filetype]

  if command ~= nil then
    require("toggleterm.terminal").Terminal:new({ cmd = command, close_on_exit = false }):toggle()
    print("Running: " .. command)
  end
end

-- vim.keymap.set("n", "<leader>tr", Run_file, nore_silent)
