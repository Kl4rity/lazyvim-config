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
    },
  },
  dependencies = {
    "haydenmeade/neotest-jest",
  },
}
