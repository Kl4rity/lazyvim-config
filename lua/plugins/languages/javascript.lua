-- JavaScript/TypeScript DAP configuration for Chromium
vim.schedule(function()
  local dap = require("dap")

  -- Manually configure pwa-chrome adapter using js-debug-adapter from Mason
  dap.adapters["pwa-chrome"] = {
    type = "server",
    host = "localhost",
    port = "${port}",
    executable = {
      command = "node",
      args = { vim.fn.stdpath("data") .. "/mason/packages/js-debug-adapter/js-debug/src/dapDebugServer.js", "${port}" },
    },
  }

  -- Configurations for React app debugging in Chromium
  dap.configurations.javascript = {
    {
      type = "pwa-chrome",
      request = "launch",
      name = "Launch Chromium against localhost",
      url = "http://localhost:5173",
      webRoot = "${workspaceFolder}",
      sourceMaps = true,
      runtimeExecutable = "/usr/bin/chromium",
    },
    {
      type = "pwa-chrome",
      request = "attach",
      name = "Attach to Chromium",
      port = 9222,
      webRoot = "${workspaceFolder}",
      sourceMaps = true,
    },
  }

  -- Apply to TypeScript and React files
  dap.configurations.typescript = dap.configurations.javascript
  dap.configurations.typescriptreact = dap.configurations.javascript
end)

return {
  -- JavaScript/TypeScript testing configuration
  {
    "nvim-neotest/neotest",
    opts = {
      adapters = {
        ["neotest-jest"] = {
          env = { CI = true },
          cwd = function()
            return vim.fn.getcwd()
          end,
        },
        ["neotest-vitest"] = {
          cwd = function()
            return vim.fn.getcwd()
          end,
        },
      },
    },
    dependencies = {
      "haydenmeade/neotest-jest",
      "marilari88/neotest-vitest",
    },
  },
}
