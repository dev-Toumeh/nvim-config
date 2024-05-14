-- i add here telescope local Functions
print("Loading telescope-unit")
local telescopeUnit = {}

function telescopeUnit.findFilesConfig()
		local project_path = vim.fn.getcwd()
    local builtin = require("telescope.builtin")
		local ignore_patterns = { ".git/", "vendor/", ".idea/", "cache/" }
		local symfonyDevEnv = "/home/naseem91/PhpstormProjects/symfony-project"

		if string.find(project_path, symfonyDevEnv) then
      print("Adding src/ to ignore patterns")
			table.insert(ignore_patterns, "src")
    else
      print("Not adding src/ to ignore patterns")
		end

   print("Not adding src/ to ignore patterns")
		builtin.find_files({
			hidden = true,
			file_ignore_patterns = ignore_patterns,
		})
end
return telescopeUnit
