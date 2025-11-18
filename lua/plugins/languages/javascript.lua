return {
  -- JavaScript/TypeScript testing configuration
  {
    "nvim-neotest/neotest",
    opts = {
      adapters = {
        ["neotest-jest"] = {
          jestCommand = "npm test --",
          jestConfigFile = "jest.config.js",
          env = { CI = true },
          cwd = function()
            return vim.fn.getcwd()
          end,
        },
      },
    },
    dependencies = {
      "haydenmeade/neotest-jest",
    },
  },
}