-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information

-- Iterate over all Lua files in the plugins directory and load them
local plugins_dir = vim.fs.joinpath(vim.fn.stdpath 'config', 'lua', 'custom', 'plugins')
for file_name, type in vim.fs.dir(plugins_dir, { follow = true }) do
  if (type == 'file' or type == 'link') and file_name:match '%.lua$' and file_name ~= 'init.lua' then
    local module = file_name:gsub('%.lua$', '')
    require('custom.plugins.' .. module)
  end
end

vim.pack.add {
  { src = 'https://github.com/youyoumu/pretty-ts-errors.nvim' },
}

require('pretty-ts-errors').setup {}

-- Show error under cursor
vim.keymap.set('n', '<leader>te', function() require('pretty-ts-errors').show_formatted_error() end, { desc = 'Show TS error' })
-- Show all errors in file
vim.keymap.set('n', '<leader>tE', function() require('pretty-ts-errors').open_all_errors() end, { desc = 'Show all TS errors' })
-- Toggle auto-display
vim.keymap.set('n', '<leader>tt', function() require('pretty-ts-errors').toggle_auto_open() end, { desc = 'Toggle TS error auto-display' })
