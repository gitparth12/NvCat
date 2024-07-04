return {
    'mbbill/undotree',
    config = function()
        local map = require('helpers.keys').map
        map('n', '<leader>u', vim.cmd.UndotreeToggle)
    end
}
