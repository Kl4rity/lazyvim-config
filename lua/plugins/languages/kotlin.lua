-- -- Kotlin DAP configuration
vim.schedule(function()
  local dap = require("dap")

  -- Kotlin debug adapter configuration
  dap.adapters.kotlin = {
    type = "executable",
    command = "kotlin-debug-adapter",
  }

  -- Kotlin debug configuration
  dap.configurations.kotlin = {
    {
      type = "kotlin",
      request = "attach",
      name = "Attach to Kotlin Process",
      hostName = "localhost",
      port = 5005,
      timeout = 60,
      projectRoot = "${workspaceFolder}",
    },
  }
end)

return {
  -- Kotlin mason packages
  {
    "mason-org/mason.nvim", -- Correct name. The package moved here.
    opts = {
      ensure_installed = { "kotlin-lsp" },
    },
  },
  -- Kotlin testing configuration
  {
    "nvim-neotest/neotest",
    opts = {
      adapters = {
        ["neotest-gradle"] = {
          -- This adapter uses Gradle's built-in test reporting
        },
      },
    },
    dependencies = {
      "weilbith/neotest-gradle",
    },
  },
}
