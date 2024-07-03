-- nvim-dap is a Debug Adapter Protocol client implementation for Neovim. nvim-dap
-- https://esvi.ai/posts/how-i-debug-php-with-neovim/
-- https://github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation#php
-- https://github.com/mfussenegger/nvim-dap-
-- https://github.com/rcarriga/nvim-dap-ui

return {
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"leoluz/nvim-dap-go",
			"rcarriga/nvim-dap-ui",
			"theHamsta/nvim-dap-virtual-text",
			"nvim-neotest/nvim-nio",
		},
		config = function()
			local has_dap, dap = pcall(require, "dap")
			if not has_dap then
				print("Failed to load 'dap'")
				return
			end
			local has_dap_ui, dapui = pcall(require, "dapui")
			if not has_dap_ui then
				print("Failed to load 'dapui'")
				return
			end

      local pluginFunc = require("utils.pluginsFunctions")
      pluginFunc.dapui.setup()

			require("dap-go").setup()

			dap.adapters.php = {
				type = "executable",
				command = "node",
				args = { "/home/naseem91/.config/nvim/lua/utils/vscode-php-debug/out/phpDebug.js" },
			}

			dap.configurations.php = {
				{
					type = "php",
					request = "launch",
					name = "Listen for Xdebug",
					port = 9003,
				},
			}
			dap.configurations.php = {
				-- to run php right from the editor
				{
					name = "run current script",
					type = "php",
					request = "launch",
					port = 9003,
					cwd = "${fileDirname}",
					program = "${file}",
					runtimeExecutable = "php",
				},
				-- to listen to any php call
				{
					name = "listen for Xdebug local",
					type = "php",
					request = "launch",
					port = 9003,
				},
				-- to listen to php call in docker container
				{
					name = "listen for Xdebug docker",
					type = "php",
					request = "launch",
					port = 9003,
					-- this is where your file is in the container
					pathMappings = {
						["/var/www/html"] = "${workspaceFolder}",
					},
				},
			}

			dap.listeners.before.attach.dapui_config = function()
				dapui.open()
			end
			dap.listeners.before.launch.dapui_config = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated.dapui_config = function()
				dapui.close()
			end
			dap.listeners.before.event_exited.dapui_config = function()
				dapui.close()
			end
		end,
	},
}
