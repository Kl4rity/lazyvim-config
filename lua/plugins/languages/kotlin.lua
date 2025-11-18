return {
  -- Kotlin debugging configuration
  {
    "mfussenegger/nvim-dap",
    optional = true,
    dependencies = {
      "nvim-dap-ui",
    },
    config = function()
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
          request = "launch",
          name = "Launch Kotlin App",
          mainClass = "MainKt",
          projectRoot = "${workspaceFolder}",
        },
      }
    end,
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