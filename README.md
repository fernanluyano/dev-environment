# Dev Environment

A curated development environment setup for macOS, featuring modern terminal tools, tmux, and Neovim.

> **⚠️ Disclaimer:** This is a personal development setup. You're welcome to use, clone, or fork it, but please review all configurations before applying them to your system. These are tailored to specific workflows and may change at any time.

## 📋 Table of Contents

- [Prerequisites](#prerequisites)
- [Core Tools](#core-tools)
- [Installation](#installation)
- [Configuration](#configuration)
- [Private Configuration](#private-configuration)
- [Usage](#usage)
- [Troubleshooting](#troubleshooting)
- [Contributing](#contributing)
- [License](#license)

## Prerequisites

- macOS (most configurations work on Linux but are not actively tested)
- Basic terminal knowledge
- Administrator access for Homebrew installation

## 🛠 Core Tools

### Package Manager & Terminal

**Homebrew** - The missing package manager for macOS
- Install from: https://brew.sh/

**iTerm2** - Enhanced terminal emulator
```bash
brew install --cask iterm2
```
> 💡 Close your current terminal and use iTerm2 from now on.

**Oh My Zsh** - Zsh configuration framework
- Install from: https://ohmyz.sh/

### Essential Utilities

**wget** - Network downloader
```bash
brew install wget
```

**Git** - Version control
```bash
brew install git
```

**GitHub CLI** - GitHub from the terminal
```bash
brew install gh
gh auth login  # Follow the prompts to authenticate
```

### Development Tools

**SDKMan** - SDK version manager (Java, Scala, etc.)
- Install from: https://sdkman.io/install/
- Don't forget to source your script as shown at the end of the installation

Example SDK installations:
```bash
# Java
sdk install java 17.0.17-zulu

# Scala
sdk install scala 2.12.20
sdk install scalacli
```

### Terminal Enhancement

**Nerd Fonts** - Fonts with icons and glyphs
```bash
brew install --cask font-jetbrains-mono-nerd-font
# Or browse all fonts:
brew search nerd-font
```

> ⚙️ Configure iTerm2 to use the Nerd Font:  
> `iTerm2 → Settings → Profiles → Text → Font → JetBrains Mono Nerd Font`

**Oh My Posh** - Prompt theme engine
```bash
brew install oh-my-posh
```
- Download themes from: https://ohmyposh.dev/docs/themes
- Example: `wget https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/atomic.omp.json -O ~/.atomic.omp.json`

**Zoxide** - Smarter cd command
```bash
brew install zoxide
```

### Productivity Tools

**Tmux** - Terminal multiplexer
```bash
brew install tmux
```

**Neovim** - Modern Vim-based text editor
```bash
brew install neovim
```

## 📦 Installation

### 1. Clone the Repository

```bash
git clone git@github.com:fernanluyano/dev-environment.git ~/dev-environment
```

> 💡 **Tip:** If you want to customize this for your own use, consider forking the repository first or clone and remove the `.git` directory.

### 2. Backup Existing Configurations

**Always backup your current configurations before proceeding:**

```bash
# Create backup directory
mkdir -p ~/.config_backup

# Backup existing files
[ -f ~/.zshrc ] && cp ~/.zshrc ~/.config_backup/zshrc.backup
[ -f ~/.tmux.conf ] && cp ~/.tmux.conf ~/.config_backup/tmux.conf.backup
[ -d ~/.config/nvim ] && cp -r ~/.config/nvim ~/.config_backup/nvim.backup
```

### 3. Create Symlinks

```bash
# Remove existing files (they're backed up!)
rm -f ~/.zshrc
rm -f ~/.tmux.conf
rm -rf ~/.config/nvim

# Create symlinks
ln -s ~/dev-environment/.zshrc ~/.zshrc
ln -s ~/dev-environment/.tmux.conf ~/.tmux.conf
ln -s ~/dev-environment/nvim ~/.config/nvim
```

### 4. Apply Configurations

```bash
# Reload zsh
source ~/.zshrc

# Reload tmux (if already running)
tmux source ~/.tmux.conf
```

## ⚙️ Configuration

### Repository Structure

```
dev-environment/
├── .zshrc           # Zsh configuration
├── .tmux.conf       # Tmux configuration
├── nvim/            # Neovim configuration
└── README.md        # This file
```

### Customization

Each configuration file can be customized to your preferences:

- **`.zshrc`** - Shell aliases, functions, and environment variables
- **`.tmux.conf`** - Tmux keybindings and appearance
- **`nvim/`** - Neovim plugins and settings

## 🔒 Private Configuration

The `.zshrc` automatically sources `~/.zshrc_private` for sensitive or machine-specific settings that shouldn't be version controlled.

### Setup Private Config

```bash
touch ~/.zshrc_private
chmod 600 ~/.zshrc_private  # Restrict permissions
```

### What to Put in Private Config

- API keys and authentication tokens
- Work or company-specific configurations
- Personal aliases and shortcuts
- Machine-specific settings
- Private environment variables

### Example `~/.zshrc_private`

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

# Tmux settings (for themes)
export TMUX_LOCATION="New York"

# API Keys (NEVER commit these!)
export OPENAI_API_KEY="sk-..."
export GITHUB_TOKEN="ghp_..."
export AWS_ACCESS_KEY_ID="AKIA..."
export AWS_SECRET_ACCESS_KEY="..."

# Work-specific shortcuts
alias work="cd ~/work/projects"
alias deploy-staging="kubectl config use-context staging && ./deploy.sh"

# Personal servers
alias homelab="ssh admin@192.168.1.100"
alias vps="ssh root@your-vps-ip"

# Custom functions
function project() {
    cd ~/projects/$1 && code .
}
```

## 🚀 Usage

### Basic Commands

After installation, you'll have access to enhanced shell features:

```bash
# Zoxide - smart directory jumping
z project-name      # Jump to frequently used directory
zi                  # Interactive directory selection

# Tmux - terminal multiplexing
tmux                # Start new session
tmux attach         # Attach to existing session
<prefix> c          # Create new window
<prefix> %          # Split pane vertically

# Neovim
nvim filename       # Open file in Neovim
```

### Updating

To update your environment with the latest changes:

```bash
cd ~/dev-environment
git pull
source ~/.zshrc
```

## 🔧 Troubleshooting

### Fonts not displaying correctly

**Problem:** Icons or characters appear as boxes or question marks.

**Solution:** 
1. Ensure Nerd Font is installed: `brew list --cask font-jetbrains-mono-nerd-font`
2. Configure iTerm2: `Settings → Profiles → Text → Font → JetBrains Mono Nerd Font`
3. Restart iTerm2

### Zsh configuration not loading

**Problem:** Custom aliases or functions aren't available.

**Solution:**
```bash
# Check if symlink is correct
ls -la ~/.zshrc

# Manually reload
source ~/.zshrc

# Check for syntax errors
zsh -n ~/.zshrc
```

### Tmux prefix key not working

**Problem:** Tmux keybindings don't respond.

**Solution:**
```bash
# Reload tmux config
tmux source ~/.tmux.conf

# Check if tmux is using the config
tmux show-options -g
```

### SDKMan command not found

**Problem:** `sdk` command doesn't work after installation.

**Solution:**
```bash
# Source the SDKMan init script
source "$HOME/.sdkman/bin/sdkman-init.sh"

# Add to .zshrc if not already present
echo 'source "$HOME/.sdkman/bin/sdkman-init.sh"' >> ~/.zshrc
```

## 🤝 Contributing

This is a personal configuration, but suggestions are welcome! I recommend you fork it to customize if desired. 

## 📝 License

MIT License - See [LICENSE](LICENSE) file for details.

