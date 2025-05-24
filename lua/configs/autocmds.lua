local M = {}

function M.setup_java_autocmds()
  local java_group = vim.api.nvim_create_augroup("JavaDevelopment", { clear = true })

  vim.api.nvim_create_autocmd("BufRead", {
    group = java_group,
    pattern = "*/src/main/java/**/*.java",
    callback = function()
      vim.opt_local.path:append("src/main/java/**")
      vim.opt_local.suffixesadd:append(".java")
      vim.b.spring_boot_project = true
      
    end,
    desc = "Setup Spring Boot Java file environment"
  })

  vim.api.nvim_create_autocmd("FileType", {
    group = java_group,
    pattern = "java",
    callback = function()
      vim.opt_local.colorcolumn = "120"
      vim.opt_local.textwidth = 120
      vim.opt_local.tabstop = 4
      vim.opt_local.shiftwidth = 4
      vim.opt_local.softtabstop = 4
      vim.opt_local.expandtab = true
      
      vim.opt_local.cindent = true
      vim.opt_local.wrap = false
    end,
    desc = "Java file formatting settings"
  })

  vim.api.nvim_create_autocmd("BufRead", {
    group = java_group,
    pattern = {
      "*/src/main/resources/application*.properties",
      "*/src/main/resources/application*.yml",
      "*/src/main/resources/application*.yaml",
      "*/src/test/resources/application*.properties",
      "*/src/test/resources/application*.yml",
      "*/src/test/resources/application*.yaml",
    },
    callback = function()
      vim.b.spring_boot_config = true
      
      local filename = vim.fn.expand("%:t")
      if filename:match("%.properties$") then
        vim.bo.filetype = "properties"
      elseif filename:match("%.ya?ml$") then
        vim.bo.filetype = "yaml"
      end
    end,
    desc = "Detect Spring Boot configuration files"
  })

  vim.api.nvim_create_autocmd("BufRead", {
    group = java_group,
    pattern = { "pom.xml", "build.gradle", "build.gradle.kts" },
    callback = function()
      vim.b.build_file = true
      local filename = vim.fn.expand("%:t")
      if filename == "pom.xml" then
        vim.b.build_tool = "maven"
      else
        vim.b.build_tool = "gradle"
      end
    end,
    desc = "Detect build files"
  })
end

-- Project Detection Autocmds
function M.setup_project_autocmds()
  local project_group = vim.api.nvim_create_augroup("ProjectDetection", { clear = true })

  -- Spring Boot project detection on directory change
  vim.api.nvim_create_autocmd("DirChanged", {
    group = project_group,
    callback = function()
      local cwd = vim.fn.getcwd()
      
      -- Check for Maven project
      if vim.fn.filereadable(cwd .. "/pom.xml") == 1 then
        local pom_content = vim.fn.readfile(cwd .. "/pom.xml")
        for _, line in ipairs(pom_content) do
          if string.match(line, "spring%-boot") then
            vim.g.spring_boot_project_root = cwd
            vim.g.project_type = "spring-boot-maven"
            break
          end
        end
      end
      
      -- Check for Gradle project
      if vim.fn.filereadable(cwd .. "/build.gradle") == 1 or vim.fn.filereadable(cwd .. "/build.gradle.kts") == 1 then
        local build_file = vim.fn.filereadable(cwd .. "/build.gradle") == 1 and "build.gradle" or "build.gradle.kts"
        local gradle_content = vim.fn.readfile(cwd .. "/" .. build_file)
        for _, line in ipairs(gradle_content) do
          if string.match(line, "spring%-boot") then
            vim.g.spring_boot_project_root = cwd
            vim.g.project_type = "spring-boot-gradle"
            break
          end
        end
      end
      
      -- Check for React/Next.js project
      if vim.fn.filereadable(cwd .. "/package.json") == 1 then
        local package_content = vim.fn.readfile(cwd .. "/package.json")
        local package_str = table.concat(package_content, "\n")
        if string.match(package_str, "next") then
          vim.g.project_type = "nextjs"
        elseif string.match(package_str, "react") then
          vim.g.project_type = "react"
        end
      end
      
      -- Check for Django project
      if vim.fn.filereadable(cwd .. "/manage.py") == 1 then
        vim.g.project_type = "django"
        vim.g.django_project_root = cwd
      end
      
      -- Check for Go project
      if vim.fn.filereadable(cwd .. "/go.mod") == 1 then
        vim.g.project_type = "golang"
        vim.g.go_project_root = cwd
      end
    end,
    desc = "Detect project type on directory change"
  })

  -- Auto-detect project on Neovim startup
  vim.api.nvim_create_autocmd("VimEnter", {
    group = project_group,
    callback = function()
      -- Trigger the same logic as DirChanged
      vim.api.nvim_exec_autocmds("DirChanged", {})
    end,
    desc = "Detect project type on startup"
  })
end

-- Additional Development Autocmds
function M.setup_dev_autocmds()
  local dev_group = vim.api.nvim_create_augroup("Development", { clear = true })

  -- Auto-save on focus lost (useful for hot reload)
  vim.api.nvim_create_autocmd("FocusLost", {
    group = dev_group,
    pattern = "*",
    callback = function()
      if vim.bo.modified and vim.bo.buftype == "" then
        vim.cmd("silent! wall")
      end
    end,
    desc = "Auto-save on focus lost"
  })

  -- Remove trailing whitespace on save
  vim.api.nvim_create_autocmd("BufWritePre", {
    group = dev_group,
    pattern = { "*.java", "*.js", "*.jsx", "*.ts", "*.tsx", "*.py", "*.go" },
    callback = function()
      local save_cursor = vim.fn.getpos(".")
      vim.cmd([[%s/\s\+$//e]])
      vim.fn.setpos(".", save_cursor)
    end,
    desc = "Remove trailing whitespace on save"
  })

  -- Format on save for specific file types
  vim.api.nvim_create_autocmd("BufWritePre", {
    group = dev_group,
    pattern = { "*.go" },
    callback = function()
      vim.lsp.buf.format({ async = false })
    end,
    desc = "Format Go files on save"
  })
end

-- Setup all autocmds
function M.setup()
  M.setup_java_autocmds()
  M.setup_project_autocmds()
  M.setup_dev_autocmds()
end

return M
