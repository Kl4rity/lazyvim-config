local M = {}

function M.run_with_debug()
  -- Check if we're in a Gradle project
  local gradlew_exists = vim.fn.filereadable("gradlew") == 1
  local build_gradle_exists = vim.fn.filereadable("build.gradle") == 1 or vim.fn.filereadable("build.gradle.kts") == 1
  
  if not (gradlew_exists and build_gradle_exists) then
    print("Error: Not in a Gradle project directory")
    print("Required files: gradlew (executable) and build.gradle or build.gradle.kts")
    return
  end
  
  local dap = require("dap")
  
  -- Ensure Java DAP adapter is registered
  local success, jdtls = pcall(require, "jdtls")
  if success then
    -- Setup Java DAP adapter through jdtls
    jdtls.setup_dap({hotcodereplace = 'auto'})
  end
  
  -- Ensure Java DAP configuration exists
  if not dap.configurations.java then
    dap.configurations.java = {}
  end
  
  -- Check if our config already exists
  local config_exists = false
  for _, config in ipairs(dap.configurations.java) do
    if config.name == "Gradle bootRun Debug" then
      config_exists = true
      break
    end
  end
  
  -- Add our debug configuration if it doesn't exist
  if not config_exists then
    table.insert(dap.configurations.java, {
      type = "java",
      request = "attach",
      name = "Gradle bootRun Debug",
      hostName = "127.0.0.1",
      port = 5005,
    })
  end
  
  -- Create a new terminal for Gradle bootRun with debugging
  -- Use Gradle's built-in debug option which should be more reliable
  print("Starting Gradle bootRun with debugging...")
  vim.cmd("belowright terminal ./gradlew bootRun --debug-jvm")
  
  -- Simple approach: wait 10 seconds and then attach
  -- This should be enough time for most Gradle applications to start
  vim.defer_fn(function()
    -- Find our debug configuration
    local config = nil
    for _, c in ipairs(dap.configurations.java) do
      if c.name == "Gradle bootRun Debug" then
        config = c
        break
      end
    end
    
    if config then
      print("Attaching debugger...")
      dap.run(config)
    else
      print("Error: Could not find Gradle bootRun Debug configuration")
    end
  end, 10000) -- Wait 10 seconds for Gradle to start
end

return M