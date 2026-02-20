# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a personal macOS development environment configuration repo (dotfiles). It contains no build system or test runner — changes are applied by symlinking config files and reloading them.

## Applying Changes

```bash
# Reload Zsh config
source ~/.zshrc

# Reload Tmux config
tmux source ~/.tmux.conf

# Neovim — restart nvim, or run :Lazy sync inside Neovim to update plugins
```

## Repository Structure

```
dev-environment/
├── .zshrc               # Zsh shell config; sources ~/.zshrc_private for secrets/machine-specific settings
├── .tmux.conf           # Tmux config
├── ideavimrc            # IdeaVim config for JetBrains IDEs
├── obsidian.vimrc       # Vim keybindings for Obsidian
├── vimium-options.json  # Vimium browser extension config
├── nvim/                # Neovim config (LazyVim-based)
└── yazi/                # Yazi file manager config
```

## Neovim Architecture

Built on [LazyVim](https://www.lazyvim.org/) with lazy.nvim as the plugin manager.

**Config layout:**
- `nvim/init.lua` — entrypoint; bootstraps lazy.nvim and loads LazyVim
- `nvim/lua/config/` — core settings (keymaps, options, autocmds, lazy setup, LSP)
- `nvim/lua/plugins/` — one file per plugin or plugin group
- `nvim/lsp/` — LSP server configs (`lua_ls.lua`, `pylsp.lua`)

**Key plugins:**
- `arrow.nvim` — file bookmarking
- `neotest` — test runner UI
- `nvim-dap` + `dapui` — debugger
- `conform.nvim` — formatting (autoformat is **disabled** by default; use `<leader>cf`)
- `claudecode.nvim` — Claude Code terminal integration
- `metals` — Scala LSP via nvim-metals
- `rustaceanvim` — Rust LSP
- `telescope.nvim` + `snacks.nvim` — fuzzy finding and UI
- `auto-session` — session persistence
- `vim-tmux-navigator` — seamless pane navigation between Neovim and Tmux

## Key Neovim Keymaps


## Tmux Config

- **Prefix:** `C-s`
- **Pane navigation:** `<prefix> h/j/k/l` (vim-style)
- **Splits:** `<prefix> -` (horizontal), `<prefix> \` (vertical)
- **New window:** `<prefix> t`
- **Reload config:** `<prefix> r`
- Plugins managed by TPM; includes Dracula theme, tmux-yank, tmux-resurrect, continuum (auto-restore sessions)

## Zsh Config Notes

- `~/.zshrc_private` is auto-sourced for machine-specific settings, API keys, and private aliases
- The config is defensive: missing optional tools show warnings but don't break the shell
- `TMUX_LOCATION` env var is set in `~/.zshrc_private` and displayed in the Dracula weather widget
