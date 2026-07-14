return {
	{
		"RRethy/base16-nvim",
		priority = 1000,
		config = function()
			require('base16-colorscheme').setup({
				base00 = '#1a1206',
				base01 = '#1a1206',
				base02 = '#a59e93',
				base03 = '#a59e93',
				base04 = '#fff6e9',
				base05 = '#fffbf5',
				base06 = '#fffbf5',
				base07 = '#fffbf5',
				base08 = '#ff8075',
				base09 = '#ff8075',
				base0A = '#ffc463',
				base0B = '#92ff7e',
				base0C = '#ffdfac',
				base0D = '#ffc463',
				base0E = '#ffce7e',
				base0F = '#ffce7e',
			})

			vim.api.nvim_set_hl(0, 'Visual', {
				bg = '#a59e93',
				fg = '#fffbf5',
				bold = true
			})
			vim.api.nvim_set_hl(0, 'Statusline', {
				bg = '#ffc463',
				fg = '#1a1206',
			})
			vim.api.nvim_set_hl(0, 'LineNr', { fg = '#a59e93' })
			vim.api.nvim_set_hl(0, 'CursorLineNr', { fg = '#ffdfac', bold = true })

			vim.api.nvim_set_hl(0, 'Statement', {
				fg = '#ffce7e',
				bold = true
			})
			vim.api.nvim_set_hl(0, 'Keyword', { link = 'Statement' })
			vim.api.nvim_set_hl(0, 'Repeat', { link = 'Statement' })
			vim.api.nvim_set_hl(0, 'Conditional', { link = 'Statement' })

			vim.api.nvim_set_hl(0, 'Function', {
				fg = '#ffc463',
				bold = true
			})
			vim.api.nvim_set_hl(0, 'Macro', {
				fg = '#ffc463',
				italic = true
			})
			vim.api.nvim_set_hl(0, '@function.macro', { link = 'Macro' })

			vim.api.nvim_set_hl(0, 'Type', {
				fg = '#ffdfac',
				bold = true,
				italic = true
			})
			vim.api.nvim_set_hl(0, 'Structure', { link = 'Type' })

			vim.api.nvim_set_hl(0, 'String', {
				fg = '#92ff7e',
				italic = true
			})

			vim.api.nvim_set_hl(0, 'Operator', { fg = '#fff6e9' })
			vim.api.nvim_set_hl(0, 'Delimiter', { fg = '#fff6e9' })
			vim.api.nvim_set_hl(0, '@punctuation.bracket', { link = 'Delimiter' })
			vim.api.nvim_set_hl(0, '@punctuation.delimiter', { link = 'Delimiter' })

			vim.api.nvim_set_hl(0, 'Comment', {
				fg = '#a59e93',
				italic = true
			})

			local current_file_path = vim.fn.stdpath("config") .. "/lua/plugins/dankcolors.lua"
			if not _G._matugen_theme_watcher then
				local uv = vim.uv or vim.loop
				_G._matugen_theme_watcher = uv.new_fs_event()
				_G._matugen_theme_watcher:start(current_file_path, {}, vim.schedule_wrap(function()
					local new_spec = dofile(current_file_path)
					if new_spec and new_spec[1] and new_spec[1].config then
						new_spec[1].config()
						print("Theme reload")
					end
				end))
			end
		end
	}
}
