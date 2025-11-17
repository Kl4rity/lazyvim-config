return {
  "nvim-neotest/neotest",
  opts = {
    adapters = {
      -- Jest adapter for JavaScript/TypeScript projects
      ["neotest-jest"] = {
        jestCommand = "npm test --",
        jestConfigFile = "jest.config.js",
        env = { CI = true },
        cwd = function()
          return vim.fn.getcwd()
        end,
      }, -- In your neotest configuration

      ["neotest-gradle"] = {
        -- This adapter uses Gradle's built-in test reporting
      },
    },
  },
  dependencies = {
    "haydenmeade/neotest-jest",
    "weilbith/neotest-gradle",
    "sidlatau/neotest-dart",
  },
}
