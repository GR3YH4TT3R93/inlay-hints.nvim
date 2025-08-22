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

### Languages

`inlay-hints.nvim` currently supports the following servers:

- [`basedpyright`](https://github.com/DetachHead/basedpyright) - [configuration](./LANGUAGES.md#basedpyright)
- [`clangd`](https://github.com/clangd/clangd) - [configuration](./LANGUAGES.md#clangd)
- [`denols`](https://github.com/denoland/deno/blob/main/cli/lsp) - [configuration](./LANGUAGES.md#denols)
- [`eclipse.jdt.ls`](https://github.com/eclipse-jdtls/eclipse.jdt.ls) - [configuration](./LANGUAGES.md#eclipsejdtls)
- [`gopls`](https://pkg.go.dev/golang.org/x/tools/gopls) - [configuration](./LANGUAGES.md#gopls)
- [`kotlin-language-server`](https://github.com/fwcd/kotlin-language-server) - [configuration](./LANGUAGES.md#kotlin-language-server)
- [`pylyzer`](https://github.com/mtshiba/pylyzer) - [configuration](./LANGUAGES.md#pylyzer)
- [`lua_ls`](https://github.com/LuaLS/lua-language-server) - [configuration](./LANGUAGES.md#lua_ls)
- [`OmniSharp`](https://github.com/OmniSharp/omnisharp-roslyn) - [configuration](./LANGUAGES.md#omnisharp)
- [`rust-analyzer`](https://github.com/rust-lang/rust-analyzer) - [configuration](./LANGUAGES.md#rust-analyzer)
- [`svelte-language-server`](https://github.com/sveltejs/language-tools) - [configuration](./LANGUAGES.md#svelte-language-server)
- [`typescript-language-server`](https://github.com/microsoft/TypeScript/wiki/Standalone-Server-(tsserver)) - [configuration](./LANGUAGES.md#typescript-language-server-tsserver)
- [`vtsls`](https://github.com/yioneko/vtsls) - [configuration](./LANGUAGES.md#vtsls)
- [`vue_ls`](https://github.com/vuejs/language-tools) - [configuration](./LANGUAGES.md#vue)
- [`zls`](https://github.com/zigtools/zls) - [configuration](./LANGUAGES.md#zls)
