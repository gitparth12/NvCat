local map = require("helpers.keys").map
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

map("n", "<C-u>", "<C-u>zz")
map("n", "<C-d>", "<C-d>zz")
map("n", "J", "mzJ`z")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- greatest remap ever
map("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
map({ "n", "v" }, "<leader>y", [["+y]])
map("n", "<leader>Y", [["+Y]])

map({ "n", "v" }, "<leader>d", [["_d]])

map("n", "Q", "<nop>")
map("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
map("n", "<leader>f", vim.lsp.buf.format)

map("n", "<C-S-k>", "<cmd>cnext<CR>zz")
map("n", "<C-S-j>", "<cmd>cprev<CR>zz")
map("n", "<leader>k", "<cmd>lnext<CR>zz")
map("n", "<leader>j", "<cmd>lprev<CR>zz")

-- <Esc>:%s/<c-r>=GetVisual()<cr>//g<left><left>
map("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
map("v", "<leader>s", [["hy:%s/<C-r>h//gc<left><left><left>]])

map("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

map("n", "<leader>fml", "<cmd>CellularAutomaton make_it_rain<CR>")

map("n", "<leader><leader>", function()
    vim.cmd("so")
end)

-- remove C-j and C-k remaps
-- map("n", "<C-J>", "")
-- map("n", "<C-K>", "")
