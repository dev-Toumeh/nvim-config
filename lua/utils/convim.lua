--[[
convim.lua
-----------
Purpose:
  Provides project-specific configuration overrides for Neovim.
  Looks for a `.convim.lua` file in the current working directory.
  If found, it merges its contents with default configurations (e.g., Telescope).
  This allows each project to customize its Neovim behavior without touching global config.

Usage:
  1. Place this file in `lua/utils/convim.lua`.
  2. In your main `init.lua`, call:
       require("utils.convim").setup()
  3. In your project root, create a `.convim.lua` file like:
       return {
         telescope = {
           pickers = {
             find_files = { cwd = "src" },
           },
         },
       }
  The `.convim.lua` file will then override or extend the default Telescope setup.
--]]

local M = {}

--[[
load_local(filename)
--------------------
Attempts to load a Lua table from the given file in the current working directory.
Returns the table if successful, or nil if the file doesn’t exist or fails to load.
--]]
function M.load_local(filename)
  local path = vim.fn.getcwd() .. "/" .. filename
  if vim.fn.filereadable(path) == 1 then
    local ok, conf = pcall(dofile, path)
    if ok and type(conf) == "table" then
      return conf
    end
  end
end

--[[
setup()
-------
Initializes plugin configurations (currently Telescope).
Loads defaults, then merges any local `.convim.lua` overrides using deep table merging.
Future: extend this pattern for LSPs, linters, or formatters.
--]]
function M.setup()
  local default_conf = {
    telescope = { defaults = { file_ignore_patterns = { "node_modules" } } },
  }

  local local_conf = M.load_local(".convim.lua")
  if local_conf and local_conf.telescope then
    default_conf.telescope =
      vim.tbl_deep_extend("force", default_conf.telescope, local_conf.telescope)
  end

  require('telescope').setup(default_conf.telescope)
end

return M
