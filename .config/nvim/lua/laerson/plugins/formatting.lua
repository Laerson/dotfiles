return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				asm = { "asmfmt" },
				latex = { "bibtex-tidy", "latexindent" },
				awk = { "awk" },
				c = { "clang-format" },
				cpp = { "clang-format" },
				cmake = { "cmake_format" },
				go = { "gofumpt", "goimports", "golines" },
				css = { "prettier" },
				html = { "prettier" },
				json = { "prettier" },
				yaml = { "prettier" },
				markdown = { "markdown-toc", "markdownlint" },
				rust = { "rustfmt" },
				bash = { "shellcheck" },
				graphql = { "prettier" },
				lua = { "stylua" },
				python = { "isort", "black" },
			},
			format_on_save = {
				lsp_fallback = true,
				async = false,
				timeout_ms = 1000,
			},
		})

		vim.keymap.set({ "n", "v" }, "<leader>mp", function()
			conform.format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 1000,
			})
		end, { desc = "Format file or range (in visual mode)" })
	end,
}
