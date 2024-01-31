return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
        -- Bubbles config for lualine
        -- Author: lokesh-krishna
        -- MIT license, see LICENSE for more details.

        -- stylua: ignore
        local colors = {
            blue     = '#89b4fa',
            black    = '#080808',
            white    = '#c6c6c6',
            red      = '#f38ba8',
            text     = "#cdd6f4",
            overlay0 = "#6c7086",
            overlay1 = "#7f849c",
            overlay2 = "#9399b2",
            surface0 = "#313244",
            surface1 = "#45475a",
            surface2 = "#585b70",
            mauve    = "#cba6f7",
            peach    = "#fab387",
            base     = "#1e1e2e",
            crust    = "#11111b",
        }

		local bubbles_theme = {
			normal = {
				a = { fg = colors.black, bg = colors.mauve },
				b = { fg = colors.overlay0, bg = colors.surface0 },
				c = { fg = colors.surface0, bg = colors.surface0 },
			},

			insert = { a = { fg = colors.black, bg = colors.blue } },
			visual = { a = { fg = colors.black, bg = colors.peach } },
			replace = { a = { fg = colors.black, bg = colors.red } },

			inactive = {
				a = { fg = colors.white, bg = colors.crust },
				b = { fg = colors.white, bg = colors.crust },
				c = { fg = colors.black, bg = colors.crust },
			},
		}

		require("lualine").setup({
			options = {
				theme = bubbles_theme,
				component_separators = "|",
				section_separators = { left = "", right = "" },
			},
			sections = {
				lualine_a = {
					{ "mode", separator = { left = "" }, right_padding = 2 },
				},
				lualine_b = { "filename", "branch" },
				lualine_c = { "fileformat" },
				lualine_x = {},
				lualine_y = { "filetype", "progress" },
				lualine_z = {
					{ "location", separator = { right = "" }, left_padding = 2 },
				},
			},
			inactive_sections = {
				lualine_a = { "filename" },
				lualine_b = {},
				lualine_c = {},
				lualine_x = {},
				lualine_y = {},
				lualine_z = { "location" },
			},
			tabline = {},
			extensions = {},
		})
	end,
}
