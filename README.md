# inlay-hints.nvim

A plugin to simplify enabling neovim offical [inlay hints](https://github.com/neovim/neovim/pull/23426)

> [!IMPORTANT]
> This will enable ALL inlay hints for a given LSP.

## Installation

Add `GR3YH4TT3R/inlay-hints.nvim` using your favorite plugin manager, like this:

[lazy.nvim](https://github.com/folke/lazy.nvim)

```lua
require("lazy").setup({
    "GR3YH4TT3R/inlay-hints.nvim",
    event = "LspAttach",
    dependencies = { "neovim/nvim-lspconfig" },
    opts = {
      -- your settings here (same as calling `require("inlay-hints").setup()`)
    }
})
```

[pckr.nvim](https://github.com/lewis6991/pckr.nvim)

```lua
require("pckr").add({
    "GR3YH4TT3R/inlay-hints.nvim",
    requires = { "neovim/nvim-lspconfig" },
    config = function()
        require("inlay-hints").setup()
    end
})
```

If you don't want to enable it globally, you can config at the `on_attach` function

**on_attach**

```lua
require("lspconfig").[server_name].setup({
  on_attach = function(client, bufnr)
    require("inlay-hints").on_attach(client, bufnr)
  end
})
```

## Configuration

### Default config

You only need to pass the options you want to override.

```lua
require("inlay-hints").setup({
  commands = { enable = true }, -- Enable InlayHints commands, include `InlayHintsToggle`, `InlayHintsEnable` and `InlayHintsDisable`
  autocmd = { enable = true } -- Enable the inlay hints on `LspAttach` event
})
```

## Languages

> > You should make sure that the LSP you are using supported inlay hints

### basedpyright

Default inlay hints for [`basedpyright`](https://github.com/DetachHead/basedpyright)
When you configure inlay hint correctly, the basedpyright's feature will be automatically enabled.

```lua
return {
  settings = {
    basedpyright = {
      analysis = {
        autoSearchPaths = true,
        diagnosticMode = "openFilesOnly",
        useLibraryCodeForTypes = true
      }
    }
  }
}
```

### clangd

If you're using [`p00f/clangd_extensions.nvim`](https://github.com/p00f/clangd_extensions.nvim), please set `autoSetHints = false`

Default inlay hints for [`clangd`](https://github.com/clangd/clangd)

```lua
return {
  settings = {
    clangd = {
      InlayHints = {
        Designators = true,
        Enabled = true,
        ParameterNames = true,
        DeducedTypes = true,
      },
      fallbackFlags = { "-std=c++20" },
    },
  }
}
```

### denols

Default inlay hints for [`denols`](https://github.com/denoland/deno/blob/main/cli/lsp)

```lua
return {
  settings = {
    deno = {
      inlayHints = {
        parameterNames = { enabled = "all", suppressWhenArgumentMatchesName = true },
        parameterTypes = { enabled = true },
        variableTypes = { enabled = true, suppressWhenTypeMatchesName = true },
        propertyDeclarationTypes = { enabled = true },
        functionLikeReturnTypes = { enable = true },
        enumMemberValues = { enabled = true },
      },
    }
  }
}
```

### eclipse.jdt.ls

Default inlay hints for [`eslipse.jdt.ls`](https://github.com/eclipse-jdtls/eclipse.jdt.ls)

```lua
return {
  settings = {
    java = {
      inlayHints = {
        parameterNames = {
          enabled = "all",
          exclusions = { "this" },
        },
      },
    }
  }
}
```

### gopls

Default inlay hints for [`gopls`](https://pkg.go.dev/golang.org/x/tools/gopls)

```lua
return {
  settings = {
    gopls = {
      hints = {
        rangeVariableTypes = true,
        parameterNames = true,
        constantValues = true,
        assignVariableTypes = true,
        compositeLiteralFields = true,
        compositeLiteralTypes = true,
        functionTypeParameters = true,
      },
    }
  }
}
```

### kotlin-language-server

Default inlay hints for [`kotlin-language-server`](https://github.com/fwcd/kotlin-language-server)

```lua
return {
  settings = {
    kotlin = {
      hints = {
        typeHints = true,
        parameterHints = true,
        chainedHints = true,
      },
    },
  }
}

```

### pylyzer

Default inlay hints for [`pylyzer`](https://github.com/mtshiba/pylyzer)

```lua
return {
  settings = {
    python = {
      inlayHints = true
    }
  }
}
```

### lua_ls

Default inlay hints for [`lua-language-server`](https://github.com/LuaLS/lua-language-server)

```lua
return {
  settings = {
    Lua = {
      hint = {
        enable = true,
        arrayIndex = "Enable",
        await = true,
        paramName = "All",
        paramType = true,
        semicolon = "SameLine",
        setType = true,
      },
    },
  },
}
```

### OmniSharp

Default inlay hints for [`OmniSharp`](https://github.com/OmniSharp/omnisharp-roslyn)
~~might work~~

```lua
return {
  settings = {
    RoslynExtensionsOptions = {
        InlayHintsOptions = {
        EnableForParameters = true,
        ForLiteralParameters = true,
        ForIndexerParameters = true,
        ForObjectCreationParameters = true,
        ForOtherParameters = true,
        SuppressForParametersThatDifferOnlyBySuffix = false,
        SuppressForParametersThatMatchMethodIntent = false,
        SuppressForParametersThatMatchArgumentName = false,
        EnableForTypes = true,
        ForImplicitVariableTypes = true,
        ForLambdaParameterTypes = true,
        ForImplicitObjectCreatio = true,
      },
    },
  }
}
```

### rust-analyzer

Default inlay hints for [`rust-analyzer`](https://github.com/rust-lang/rust-analyzer) (Compatible with [`mrcjkb/rustaceanvim`](https://github.com/mrcjkb/rustaceanvim))

```lua
return {
  settings = {
    ["rust-analyzer"] = {
      inlayHints = {
        bindingModeHints = {
          enable = false,
        },
        chainingHints = {
          enable = true,
        },
        closingBraceHints = {
          enable = true,
          minLines = 25,
        },
        closureReturnTypeHints = {
          enable = "never",
        },
        lifetimeElisionHints = {
          enable = "never",
          useParameterNames = false,
        },
        maxLength = 25,
        parameterHints = {
          enable = true,
        },
        reborrowHints = {
          enable = "never",
        },
        renderColons = true,
        typeHints = {
          enable = true,
          hideClosureInitialization = false,
          hideNamedConstructor = false,
        },
      },
    }
  }
}
```

### svelte-language-server

Default inlay hints for [`svelte-language-server`](https://github.com/sveltejs/language-tools)

```lua
return {
  settings = {
    typescript = {
      inlayHints = {
        parameterNames = { enabled = 'all' },
        parameterTypes = { enabled = true },
        variableTypes = { enabled = true },
        propertyDeclarationTypes = { enabled = true },
        functionLikeReturnTypes = { enabled = true },
        enumMemberValues = { enabled = true },
      },
    },
  },
}
```

### typescript-language-server (tsserver)

If you're using
[`pmizio/typescript-tools.nvim`](https://github.com/pmizio/typescript.nvim), you enable it like this

```lua
require("typescript-tools").setup({
  settings = {
    tsserver_file_preferences = {
      includeInlayParameterNameHints = "all",
      includeInlayParameterNameHintsWhenArgumentMatchesName = false,
      includeInlayFunctionParameterTypeHints = true,
      includeInlayVariableTypeHints = true,
      includeInlayVariableTypeHintsWhenTypeMatchesName = false,
      includeInlayPropertyDeclarationTypeHints = true,
      includeInlayFunctionLikeReturnTypeHints = true,
      includeInlayEnumMemberValueHints = true,
    }
  }
})
```

Default inlay hints for [`tsserver`](<https://github.com/microsoft/TypeScript/wiki/Standalone-Server-(tsserver)>)

```lua
return {
  settings = {
    typescript = {
      inlayHints = {
        includeInlayParameterNameHints = "all",
        includeInlayParameterNameHintsWhenArgumentMatchesName = true,
        includeInlayFunctionParameterTypeHints = true,
        includeInlayVariableTypeHints = true,
        includeInlayVariableTypeHintsWhenTypeMatchesName = true,
        includeInlayPropertyDeclarationTypeHints = true,
        includeInlayFunctionLikeReturnTypeHints = true,
        includeInlayEnumMemberValueHints = true,
      },
    },
    javascript = {
      inlayHints = {
        includeInlayParameterNameHints = "all",
        includeInlayParameterNameHintsWhenArgumentMatchesName = true,
        includeInlayFunctionParameterTypeHints = true,
        includeInlayVariableTypeHints = true,
        includeInlayVariableTypeHintsWhenTypeMatchesName = true,
        includeInlayPropertyDeclarationTypeHints = true,
        includeInlayFunctionLikeReturnTypeHints = true,
        includeInlayEnumMemberValueHints = true,
      },
    },
  }
}
```

### vtsls

Default inlay hints for [`vtsls`](https://github.com/yioneko/vtsls)

> Original contribution by [`lucicoreyli`](https://github.com/lucioreyli)
> updated by [`GR3YH4TT3R`](https://github.com/GR3YH4TT3R)

```lua
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
```

### Vue

Default inlay hints for [`vue_ls`](https://github.com/vuejs/language-tools)

```lua
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
```

### zls

Default inlay hints for [`zls`](https://github.com/zigtools/zls)

```lua
return {
  settings = {
    zls = {
      enable_inlay_hints = true,
      inlay_hints_show_builtin = true,
      inlay_hints_exclude_single_argument = true,
      inlay_hints_hide_redundant_param_names = false,
      inlay_hints_hide_redundant_param_names_last_token = false,
    },
  }
}
```
