local M = {}

function M.setup()
  local opt = vim.opt
  local g = vim.g

  g.java_home = "/usr/lib/jvm/java-21-openjdk-amd64"
  vim.env.JAVA_HOME = "/usr/lib/jvm/java-21-openjdk-amd64"
  vim.env.PATH = vim.env.JAVA_HOME .. "/bin:" .. vim.env.PATH

  g.maven_home = os.getenv "HOME" .. "/.m2"

  opt.expandtab = true
  opt.relativenumber = true

  vim.filetype.add {
    extension = {
      java = "java",
      xml = "xml",
      properties = "properties",
      yml = "yaml",
      yaml = "yaml",
    },
    filename = {
      ["pom.xml"] = "xml",
      ["application.properties"] = "properties",
      ["application.yml"] = "yaml",
      ["application.yaml"] = "yaml",
      ["application-dev.properties"] = "properties",
      ["application-prod.properties"] = "properties",
      ["application-test.properties"] = "properties",
      ["bootstrap.properties"] = "properties",
      ["bootstrap.yml"] = "yaml",
    },
  }
end

function M.jdtls_config()
  local jdtls = require "jdtls"
  local home = os.getenv "HOME"
  local workspace_path = home .. "/workspace/"
  local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
  local workspace_dir = workspace_path .. project_name

  local config = {
    cmd = {
      "java",
      "-Declipse.application=org.eclipse.jdt.ls.core.id1",
      "-Dosgi.bundles.defaultStartLevel=4",
      "-Declipse.product=org.eclipse.jdt.ls.core.product",
      "-Dlog.protocol=true",
      "-Dlog.level=ALL",
      "-javaagent:" .. home .. "/.local/share/nvim/mason/packages/jdtls/lombok.jar",
      "-Xms1g",
      "--add-modules=ALL-SYSTEM",
      "--add-opens",
      "java.base/java.util=ALL-UNNAMED",
      "--add-opens",
      "java.base/java.lang=ALL-UNNAMED",
      "-jar",
      vim.fn.glob(home .. "/.local/share/nvim/mason/packages/jdtls/plugins/org.eclipse.equinox.launcher_*.jar"),
      "-configuration",
      home .. "/.local/share/nvim/mason/packages/jdtls/config_linux",
      "-data",
      workspace_dir,
    },

    root_dir = require("jdtls.setup").find_root { ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" },

    settings = {
      java = {
        eclipse = {
          downloadSources = true,
        },
        configuration = {
          updateBuildConfiguration = "interactive",
          runtimes = {
            {
              name = "JavaSE-17",
              path = "/usr/lib/jvm/java-17-openjdk-amd64/",
            },
            {
              name = "JavaSE-21",
              path = "/usr/lib/jvm/java-21-openjdk-amd64/",
            },
          },
        },
        maven = {
          downloadSources = true,
        },
        implementationsCodeLens = {
          enabled = true,
        },
        referencesCodeLens = {
          enabled = true,
        },
        references = {
          includeDecompiledSources = true,
        },
        format = {
          enabled = true,
          settings = {
            url = vim.fn.stdpath "config" .. "/lang-servers/intellij-java-google-style.xml",
            profile = "GoogleStyle",
          },
        },
      },
      signatureHelp = { enabled = true },
      completion = {
        favoriteStaticMembers = {
          "org.hamcrest.MatcherAssert.assertThat",
          "org.hamcrest.Matchers.*",
          "org.hamcrest.CoreMatchers.*",
          "org.junit.jupiter.api.Assertions.*",
          "java.util.Objects.requireNonNull",
          "java.util.Objects.requireNonNullElse",
          "org.mockito.Mockito.*",
          "org.springframework.test.web.servlet.MockMvcRequestBuilders.*",
          "org.springframework.test.web.servlet.result.MockMvcResultMatchers.*",
        },
      },
      contentProvider = { preferred = "fernflower" },
      extendedClientCapabilities = jdtls.extendedClientCapabilities,
      sources = {
        organizeImports = {
          starThreshold = 9999,
          staticStarThreshold = 9999,
        },
      },
      codeGeneration = {
        toString = {
          template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}",
        },
        useBlocks = true,
      },
    },

    flags = {
      allow_incremental_sync = true,
    },

    init_options = {
      bundles = {
        vim.fn.glob(home .. "/.local/share/nvim/mason/packages/java-debug-adapter/extension/server/com.microsoft.java.debug.plugin-*.jar"),
      },
    },
  }

  jdtls.start_or_attach(config)
end

return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    config = function() end,
  },

  {
    "mfussenegger/nvim-jdtls",
    ft = "java",
    config = function()
      M.setup()
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "java",
        callback = function()
          M.jdtls_config()
        end,
      })
    end,
  },
}
