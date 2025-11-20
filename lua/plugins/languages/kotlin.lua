-- Kotlin DAP configuration
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
      request = "launch",
      name = "Launch Kotlin App",
      mainClass = "MainKt",
      projectRoot = "${workspaceFolder}",
    },
  }
end)

-- Kotlin LSP setup
vim.schedule(function()
  local lspconfig = require("lspconfig")
  lspconfig.configs.kotlin_lsp = {
    default_config = {
      cmd = { "java", "-jar", vim.fn.expand("~/.local/share/nvim/mason/packages/kotlin-lsp/kotlin-lsp.jar") },
      filetypes = { "kotlin" },
      root_dir = lspconfig.util.root_pattern(
        "settings.gradle.kts",
        "settings.gradle",
        "build.gradle.kts",
        "build.gradle"
      ),
      settings = {},
    },
  }
  lspconfig.kotlin_lsp.setup({
    cmd_env = {
      JAVA_HOME = "/home/deliberate/.local/share/mise/installs/java/17.0.2",
    },
  })
end)

return {
  -- Kotlin mason packages
  {
    "williamboman/mason.nvim",
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
