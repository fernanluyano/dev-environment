# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Make sure you have git and tmux installed
plugins=(git tmux)
ZSH_TMUX_AUTOSTART=true

source $ZSH/oh-my-zsh.sh

eval $(ssh-agent)

export SDKMAN_DIR=$(brew --prefix sdkman-cli)/libexec
[[ -s "${SDKMAN_DIR}/bin/sdkman-init.sh" ]] && source "${SDKMAN_DIR}/bin/sdkman-init.sh"


# pnpm
export PNPM_HOME="$HOME/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

eval "$(pyenv virtualenv-init -)"
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"

# NEOVIM

export NVIM_DIR="$HOME/.nvm"
[ -s "$NVIM_DIR/nvm.sh" ] && \. "$NVIM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

export VISUAL=nvim
export EDITOR=nvim

# Aliases

alias vim=nvim
alias aws_creds="vim ~/.aws/credentials"
alias edit_zsh="vim ~/.zshrc"
alias edit_nvim="vim ~/.config/nvim"
alias edit_tmux="vim ~/.tmux.conf"

eval "$(zoxide init zsh)"

# Load private configuration
if [ -f ~/.zshrc_private ]; then
    source ~/.zshrc_private
fi
