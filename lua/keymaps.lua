-- [[ Basic Keymaps ]]
-- This file is automatically loaded by lazyvim.config.init
local Util = require("lazyvim.util")

-- DO NOT USE THIS IN YOU OWN CONFIG!!
-- use `vim.keymap.set` instead
local map = Util.safe_keymap_set


-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
-- vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

-- vim: ts=2 sts=2 sw=2 et
-- custom:
-- set <C-;> to escape
function enter_normal_mode()
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "n", true)
end

-- use <C-;> as ESC
vim.keymap.set(
  "i",
  "<C-;>",
  "<cmd>lua enter_normal_mode()<CR>",
  { desc = "Enter normal mode.", noremap = true, silent = true }
)
vim.keymap.set(
  "n",
  "<C-;>",
  "<cmd>lua enter_normal_mode()<CR>",
  { desc = "Enter normal mode.", noremap = true, silent = true }
)
vim.keymap.set(
  "v",
  "<C-;>",
  "<cmd>lua enter_normal_mode()<CR>",
  { desc = "Enter normal mode.", noremap = true, silent = true }
)
vim.keymap.set(
  "c",
  "<C-;>",
  "<cmd>lua enter_normal_mode()<CR>",
  { desc = "Enter normal mode.", noremap = true, silent = true }
)
vim.keymap.set(
  "t",
  "<C-;>",
  "<cmd>lua enter_normal_mode()<CR>",
  { desc = "Enter normal mode.", noremap = true, silent = true }
)
vim.keymap.set("n", "<leader>pv", vim.cmd.Explore, { desc = "Enter netrw" })

vim.keymap.set("i", "<C-l>", "<Right>", { noremap = true })
vim.keymap.set("i", "<C-h>", "<Left>", { noremap = true })
vim.keymap.set("i", "<C-j>", "<Down>", { noremap = true, silent = true })
vim.keymap.set("i", "<C-k>", "<Up>", { noremap = true, silent = true })
vim.keymap.set("i", "<C-w>", "<Esc>:normal! w<CR>a", { noremap = true, silent = true })
vim.keymap.set("i", "<C-e>", "<Esc>:normal! e<CR>a", { noremap = true, silent = true })
vim.keymap.set("i", "<C-b>", "<Esc>:normal! b<CR>a", { noremap = true, silent = true })

vim.keymap.set(
  { "n", "v" },
  "]<space>",
  "<CMD>call append(line('.'), repeat([''], v:count1))<CR>",
  { silent = true, desc = "Insert newline above current position." }
)

vim.keymap.set(
  { "n", "v" },
  "[<space>",
  "<CMD>call append(line('.')-1, repeat([''], v:count1))<CR>",
  { silent = true, desc = "Insert newline above current selection." }
)

-- from lazyvim
-- floating terminal
local lazyterm = function() Util.terminal(nil, { cwd = Util.root() }) end
map("n", "<leader>ft", lazyterm, { desc = "Terminal (root dir)" })
map("n", "<leader>fT", function() Util.terminal() end, { desc = "Terminal (cwd)" })
map("n", "<c-/>", lazyterm, { desc = "Terminal (root dir)" })
map("n", "<c-_>", lazyterm, { desc = "which_key_ignore" })

-- Terminal Mappings
map("t", "<esc><esc>", "<c-\\><c-n>", { desc = "Enter Normal Mode" })
map("t", "<C-h>", "<cmd>wincmd h<cr>", { desc = "Go to left window" })
map("t", "<C-j>", "<cmd>wincmd j<cr>", { desc = "Go to lower window" })
map("t", "<C-k>", "<cmd>wincmd k<cr>", { desc = "Go to upper window" })
map("t", "<C-l>", "<cmd>wincmd l<cr>", { desc = "Go to right window" })
map("t", "<C-/>", "<cmd>close<cr>", { desc = "Hide Terminal" })
map("t", "<c-_>", "<cmd>close<cr>", { desc = "which_key_ignore" })

-- windows
map("n", "<leader>ww", "<C-W>p", { desc = "Other window", remap = true })
map("n", "<leader>wd", "<C-W>c", { desc = "Delete window", remap = true })
map("n", "<leader>w-", "<C-W>s", { desc = "Split window below", remap = true })
map("n", "<leader>w|", "<C-W>v", { desc = "Split window right", remap = true })
map("n", "<leader>-", "<C-W>s", { desc = "Split window below", remap = true })
map("n", "<leader>|", "<C-W>v", { desc = "Split window right", remap = true })

-- lazy
map("n", "<leader>l", "<cmd>Lazy<cr>", { desc = "Lazy" })

-- new file
map("n", "<leader>fn", "<cmd>enew<cr>", { desc = "New File" })

map("n", "<leader>xl", "<cmd>lopen<cr>", { desc = "Location List" })
map("n", "<leader>xq", "<cmd>copen<cr>", { desc = "Quickfix List" })

map("n", "[q", vim.cmd.cprev, { desc = "Previous quickfix" })
map("n", "]q", vim.cmd.cnext, { desc = "Next quickfix" })
