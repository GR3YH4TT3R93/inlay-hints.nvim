---@class vim.lsp.Config
return {
  settings = {
    java = {
      inlayHints = {
        parameterNames = {
          enabled = "all",
          exclusions = { "this" },
        },
      },
    },
  },
}
