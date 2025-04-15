return {
	"stevearc/conform.nvim",
	opts = {
		formatters = {
			xmllint = {
				command = "xmllint",
				args = { "--format", "-" },
				stdin = true,
			},
			tidy = {
				command = "tidy",
				args = { "--tidy-mark", "no", "-quiet", "-indent", "-wrap", "0" },
				stdin = true,
			},
            beautysh = {
                command = "beautysh",
                args = { "-" },
                stdin = true,
            },
		},

		formatters_by_ft = {
			lua = { "stylua" },
			sh = { "beautysh" },
			json = { "jq" },
			html = { { "prettierd", "prettier", "tidy" } },
			css = { { "prettierd", "prettier", "tidy" } },
			xhtml = { "xmllint", "tidy" },
			xml = { "xmllint" },
			xsd = { "xmllint" },
			javascript = { { "prettierd", "prettier" } },
			typescript = { { "prettierd", "prettier" } },
		},
	},
}
