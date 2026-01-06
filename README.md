# Dev Environment

My personal development environment configuration files.

> **⚠️ Disclaimer:** This is my personal development setup. You're welcome to use, clone, or fork it, but please use at your own risk. Review the configurations before applying them to your system, as they're tailored to my specific workflow and preferences.

## Installation

1. Clone this repository:
```bash
git clone git@github.com:fernanluyano/dev-environment.git ~/dev-environment
```

2. Create symlinks to your home directory:
```bash
# Backup your current configs first!
mv ~/.zshrc ~/.zshrc.backup

# Create symlinks
ln -s ~/dev-environment/.zshrc ~/.zshrc
```

3. Reload your shell:
```bash
source ~/.zshrc
```

## Private Configuration

This `.zshrc` sources a private configuration file (`~/.zshrc_private`) that is **not** tracked in version control. This is where you should put:

- API keys and tokens
- Work/company-specific configurations
- Personal aliases and secrets
- Machine-specific settings

### Setting up your private config

Create `~/.zshrc_private` in your home directory:

```bash
touch ~/.zshrc_private
```

The public `.zshrc` will automatically load this file if it exists.

### Example `~/.zshrc_private`

Here's an example of what you might put in your private config file:

```bash
# Custom ASCII welcome message
clear
echo "\033[1;32m"  # Bright green
cat << "EOF"
    ███████╗██╗   ██╗███████╗████████╗███████╗███╗   ███╗
    ██╔════╝╚██╗ ██╔╝██╔════╝╚══██╔══╝██╔════╝████╗ ████║
    ███████╗ ╚████╔╝ ███████╗   ██║   █████╗  ██╔████╔██║
    ╚════██║  ╚██╔╝  ╚════██║   ██║   ██╔══╝  ██║╚██╔╝██║
    ███████║   ██║   ███████║   ██║   ███████╗██║ ╚═╝ ██║
    ╚══════╝   ╚═╝   ╚══════╝   ╚═╝   ╚══════╝╚═╝     ╚═╝
EOF
echo "\033[0;32m"  # Normal green
echo "    ════════════════════════════════════════════════════"
echo "\033[1;32m              ░▒▓ READY TO CODE ▓▒░\033[0m"
echo ""
echo "\033[0;32m    [SYSTEM ONLINE]"
echo "    > USER: $(whoami)"
echo "    > TIME: $(date '+%H:%M:%S')"
echo "    > PATH: $(pwd)\033[0m"
echo ""

# Private environment variables
export OPENAI_API_KEY="your-key-here"
export GITHUB_TOKEN="your-token-here"

# Work-specific aliases
alias work="cd ~/work/projects"
alias vpn="sudo openconnect work.vpn.com"

# Personal shortcuts
alias personal_server="ssh user@192.168.1.100"
```

**Note:** Customize this to your own preferences! The welcome message, aliases, and environment variables are just examples.

## What's Included

- **Oh My Zsh** configuration with robbyrussell theme
- **Plugins:** git, tmux (with auto-start)
- **Tools:** pyenv, nvm, pnpm, sdkman, zoxide
- **Editor:** neovim as default (with helpful aliases)
- **Tmux:** Auto-starts on shell launch

## Requirements

Make sure you have these installed:

- [Oh My Zsh](https://ohmyz.sh/)
- [Homebrew](https://brew.sh/) (macOS)
- tmux
- neovim
- pyenv
- nvm
- pnpm
- sdkman
- zoxide

## Customization

Feel free to fork this repo and customize it to your needs. The configuration is designed to be modular and easy to modify.

## License

MIT
