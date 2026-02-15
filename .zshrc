# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Make sure you have git and tmux installed
plugins=(git tmux)

# Only autostart tmux if SKIP_TMUX is not set. A use case is for other 
# IDEs / Editors if you don't want them to start it with tmux
#
# export SKIP_TMUX=1
if [ -z "$SKIP_TMUX" ]; then
    ZSH_TMUX_AUTOSTART=true
else
    ZSH_TMUX_AUTOSTART=false
fi

# Source Oh My Zsh if available
if [ -f "$ZSH/oh-my-zsh.sh" ]; then
    source $ZSH/oh-my-zsh.sh
else
    echo "⚠️  Warning: Oh My Zsh not found at $ZSH"
fi

# SSH Agent
if command -v ssh-agent &> /dev/null; then
    eval $(ssh-agent) 2>/dev/null
fi



# pnpm - only configure if installed
if command -v pnpm &> /dev/null; then
    export PNPM_HOME="$HOME/Library/pnpm"
    case ":$PATH:" in
      *":$PNPM_HOME:"*) ;;
      *) export PATH="$PNPM_HOME:$PATH" ;;
    esac
else
    echo "⚠️  Warning: pnpm not found"
fi
# pnpm end

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv &> /dev/null; then
    eval "$(pyenv init -)"
    if command -v pyenv-virtualenv-init &> /dev/null; then
        eval "$(pyenv virtualenv-init -)"
    fi
else
    echo "⚠️  Warning: pyenv not found (optional tool)"
fi

# NVM (Node Version Manager) - only load if installed
export NVM_DIR="$HOME/.nvm"
if [ -s "$NVM_DIR/nvm.sh" ]; then
    \. "$NVM_DIR/nvm.sh"
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
else
    echo "⚠️  Warning: nvm not found at $NVM_DIR"
fi

# NEOVIM
if command -v nvim &> /dev/null; then
    export VISUAL=nvim
    export EDITOR=nvim
    alias vim=nvim
else
    echo "⚠️  Warning: neovim not found"
    export VISUAL=vim
    export EDITOR=vim
fi

# Aliases
alias aws_creds="$EDITOR ~/.aws/credentials"
alias edit_zsh="$EDITOR ~/.zshrc"
alias source_zsh="source ~/.zshrc"
alias edit_nvim="$EDITOR ~/.config/nvim"
alias edit_tmux="$EDITOR ~/.tmux.conf"

# Zoxide - only set alias if available
if command -v zoxide &> /dev/null; then
    eval "$(zoxide init zsh)"
    alias cd=z
else
    echo "⚠️  Warning: zoxide not found (cd command will use default behavior)"
fi

# LazyGit only set alias if available
if command -v lazygit &> /dev/null; then
    alias lgit=lazygit
else
    echo "⚠️  Warning: lazygit not found"
fi

# Load private configuration first
if [ -f ~/.zshrc_private ]; then
    source ~/.zshrc_private
fi

# Oh My Posh - only load if available
if command -v oh-my-posh &> /dev/null; then
  if [ -n "$OHMYPOSH_THEME" ] && [ -f "$OHMYPOSH_THEME" ]; then
    eval "$(oh-my-posh init zsh --config $OHMYPOSH_THEME)"
  else
    echo "⚠️  Warning: oh-my-posh theme not configured (set OHMYPOSH_THEME in ~/.zshrc_private)"
  fi
else
  echo "⚠️  Warning: oh-my-posh not found (using default prompt)"
fi

# SDKMan - only load if installed
if brew --prefix sdkman-cli &> /dev/null; then
    export SDKMAN_DIR=$(brew --prefix sdkman-cli)/libexec
    [[ -s "${SDKMAN_DIR}/bin/sdkman-init.sh" ]] && source "${SDKMAN_DIR}/bin/sdkman-init.sh"
else
    echo "⚠️  Warning: sdkman not found (optional tool)"
fi

# Yazi
export EDITOR="nvim"
if command -v yazi &> /dev/null; then
    function y() {
        local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
        yazi "$@" --cwd-file="$tmp"
        if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
            builtin cd -- "$cwd"
        fi
        rm -f -- "$tmp"
    }
else
    echo "⚠️  Warning: yazi not found (y function not available)"
fi
