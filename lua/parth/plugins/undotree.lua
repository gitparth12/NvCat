return {
    'mbbill/undotree',
    config = function()
        local map = require('parth.helpers.keys').map
        map('n', '<leader>u', vim.cmd.UndotreeToggle)
    end
}
