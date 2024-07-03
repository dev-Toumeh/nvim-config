local dapui = {}

dapui.setup = function()
			require("dapui").setup({
				controls = {
					element = "scopes", -- Changed from "repl" to a valid element
					enabled = true,
					icons = {
						disconnect = "",
						pause = "",
						play = "",
						run_last = "",
						step_back = "",
						step_into = "",
						step_out = "",
						step_over = "",
						terminate = "",
					},
				},
				element_mappings = {},
				expand_lines = true,
				floating = {
					border = "single",
					mappings = {
						close = { "q", "<Esc>" },
					},
				},
				force_buffers = true,
				icons = {
					collapsed = "▸",
					current_frame = "",
					expanded = "▾",
				},
				layouts = {
					{
						elements = {
							{
								id = "breakpoints",
								size = 0.5, -- Adjusted size (50% of the left layout)
							},
							{
								id = "stacks",
								size = 0.5, -- Adjusted size (50% of the left layout)
							},
						},
						position = "left",
						size = 40, -- Reduced width of the left layout to 20%
					},
					{
						elements = {
							{
								id = "scopes",
								size = 1.0, -- Takes up the full height of the bottom layout
							},
						},
						position = "bottom",
						size = 10, -- Height of the bottom layout
					},
				},
				mappings = {
					edit = "e",
					expand = { "<CR>", "<2-LeftMouse>" },
					open = "o",
					remove = "d",
					repl = "r",
					toggle = "t",
				},
				render = {
					indent = 1,
					max_value_lines = 100,
				},
			})
end

local other_config = {}

other_config.some_function = function()
  -- Your other configuration or functions
  print("Other configuration function called")
end

return {
  dapui = dapui,
  other_config = other_config
}
