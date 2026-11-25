if vim.loader then
	vim.loader.enable()
end

require("phillychi3.config.options")
require("phillychi3.config.keymaps")
require("phillychi3.config.autocmds")
require("phillychi3.plugins")
