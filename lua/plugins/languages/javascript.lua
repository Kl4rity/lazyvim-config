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

