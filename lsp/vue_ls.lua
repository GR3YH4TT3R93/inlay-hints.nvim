---@class vim.lsp.Config
return {
  settings = {
    typescript = {
      inlayHints = {
        enumMemberValues = {
          enabled = true,
        },
        functionLikeReturnTypes = {
          enabled = true,
        },
        propertyDeclarationTypes = {
          enabled = true,
        },
        parameterTypes = {
          enabled = true,
          suppressWhenArgumentMatchesName = true,
        },
        variableTypes = {
          enabled = true,
        },
      },
    },
    vue = {
      inlayHints = {
        destructuredProps = true,
        inlineHandlerLoading = true,
        missingProps = true,
        optionsWrapper = true,
        vBindShorthand = true,
      },
    },
  },
}
