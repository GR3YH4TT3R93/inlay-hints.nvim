---@class vim.lsp.Config
return {
  settings = {
    typescript = {
      inlayHints = {
        variableTypes = { enabled = true },
        parameterNames = { enabled = "all" },
        enumMemberValues = { enabled = true },
        functionLikeReturnTypes = { enabled = true },
        propertyDeclarationTypes = { enabled = true },
        parameterTypes = {
          enabled = true,
          suppressWhenArgumentMatchesName = false,
        },
      },
    },
  },
}
