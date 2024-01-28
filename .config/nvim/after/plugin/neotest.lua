local status, mod = pcall(require, 'neotest')
if not status then
  return
end

mod.setup({
  adapters = {

    require('neotest-jest')({
      jestCommand = require('neotest-jest.jest-util').getJestCommand(
        vim.fn.expand('%:p:h')
      ) .. ' --silent',
      jestConfigFile = function()
        local file = vim.fn.expand('%:p')
        if string.find(file, '/packages/') then
          return string.match(file, '(.-/[^/]+/)src') .. 'jest.config.ts'
        end

        return vim.fn.getcwd() .. '/jest.config.ts'
      end,
      env = { CI = true },
      cwd = function(path)
        return vim.fn.getcwd()
      end,
    }),
  },
})
