return {
  "mfussenegger/nvim-dap",
  optional = true,
  init = function()
    -- Only set up the keymap if we're in a Gradle project
    local function is_gradle_project()
      local gradlew_exists = vim.fn.filereadable("gradlew") == 1
      local build_gradle_exists = vim.fn.filereadable("build.gradle") == 1 or vim.fn.filereadable("build.gradle.kts") == 1
      return gradlew_exists and build_gradle_exists
    end
    
    if is_gradle_project() then
      vim.keymap.set("n", "<leader>rd", function()
        require("user.gradle-bootrun").run_with_debug()
      end, { desc = "Run Debug" })
    end
  end,
}