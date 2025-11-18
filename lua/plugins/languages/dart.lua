-- Dart DAP configuration
vim.schedule(function()
  local dap = require("dap")

  -- Flutter debug adapter configuration
  dap.adapters.dart = {
    type = "executable",
    command = "flutter",
    args = { "debug_adapter" },
  }

  -- Flutter debug configuration
  dap.configurations.dart = {
    {
      type = "dart",
      request = "launch",
      name = "Launch Flutter App",
      dartSdkPath = "/usr/lib/dart",
      flutterSdkPath = "/usr/bin/flutter",
      program = "${workspaceFolder}/lib/main.dart",
      cwd = "${workspaceFolder}",
      toolArgs = { "--device-id", "linux" },
    },
    {
      type = "dart",
      request = "launch",
      name = "Launch Flutter App (Debug)",
      dartSdkPath = "/usr/lib/dart",
      flutterSdkPath = "/usr/bin/flutter",
      program = "${workspaceFolder}/lib/main.dart",
      cwd = "${workspaceFolder}",
      flutterMode = "debug",
      toolArgs = { "--device-id", "linux" },
    },
    {
      type = "dart",
      request = "launch",
      name = "Launch Flutter App (Profile)",
      dartSdkPath = "/usr/lib/dart",
      flutterSdkPath = "/usr/bin/flutter",
      program = "${workspaceFolder}/lib/main.dart",
      cwd = "${workspaceFolder}",
      flutterMode = "profile",
      toolArgs = { "--device-id", "linux" },
    }
  }
end)

return {
  -- Dart testing configuration
  {
    "nvim-neotest/neotest",
    opts = {
      adapters = {
        ["neotest-dart"] = {
          -- Dart testing adapter
        },
      },
    },
    dependencies = {
      "sidlatau/neotest-dart",
    },
  },
}

