if not vim.fn.has("nvim-0.11") == 1 then
  vim.notify("This plugin only works with neovim 0.11+, please update your neovim version", vim.log.levels.ERROR)
  return
end

local M = {}

M.setup = function(user_config)
  vim.validate("user_config", user_config, "table", true)
  require("inlay-hints.config").load(user_config)
end

return M
