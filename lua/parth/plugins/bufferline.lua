return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = "nvim-tree/nvim-web-devicons",
  config = function()
    require("bufferline").setup({
      options = {
        hover = {
          enabled = true,
          delay = 200,
          reveal = { "close" },
        },
        separator_style = "slant",
      },
    })
    vim.keymap.set("n", "<S-l>", "<CMD>BufferLineCycleNext<CR>", { desc = "Move to the next buffer" })
    vim.keymap.set("n", "<S-h>", "<CMD>BufferLineCyclePrev<CR>", { desc = "Move to the previous buffer" })
    vim.keymap.set("n", "]b", "<CMD>BufferLineMoveNext<CR>", { desc = "Move buffer tab forward" })
    vim.keymap.set("n", "[b", "<CMD>BufferLineMovePrev<CR>", { desc = "Move buffer tab back" })
  end,
}
