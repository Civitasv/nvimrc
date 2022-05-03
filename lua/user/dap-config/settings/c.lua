local file = require("user.utils.file")
local dap = require('dap')

dap.configurations.c = {
  {
    name = "C Debug And Run",
    type = "codelldb",
    request = "launch",
    program = function ()
      local fileName = vim.fn.expand('%:t:r')
      if(not file.exists("bin")) then
        -- create this directory
        os.execute("mkdir " .. "bin")
      end
      local cmd = "!gcc -g % -o bin/" .. fileName
      -- First, compile it
      vim.cmd(cmd)
      -- Then, return it
      return '${fileDirname}/bin/' .. fileName
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = true
  },
}

