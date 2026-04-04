# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv init - zsh)"

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && . "/opt/homebrew/opt/nvm/nvm.sh"

# PATH extras
export PATH="$PATH:$HOME/.antigravity/antigravity/bin"
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

# uv
. "$HOME/.local/bin/env"

# Prompt
eval "$(starship init zsh)"
