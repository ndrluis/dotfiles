export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export BASH_SILENCE_DEPRECATION_WARNING=1

export EDITOR=nvim
export COLORTERM=truecolor

eval "$(/opt/homebrew/bin/brew shellenv)"

source $(brew --prefix)/share/antigen/antigen.zsh

antigen use oh-my-zsh
antigen theme lunks/minimim
antigen apply

# asdf
export ASDF_DIR=$(brew --prefix asdf)/libexec
. $(brew --prefix asdf)/libexec/asdf.sh

# local stuff
[ -f ~/.zshrc.local ] && source ~/.zshrc.local

# aliases
alias j=z
alias v="nvim"
alias vi="nvim"
alias vim="nvim"
alias cat="bat"
alias glb="git for-each-ref --count=5 --sort=-committerdate refs/heads/ --format='%(color:yellow)%(refname:short)%(color:reset) %0a %(subject)'"
alias gs='git status'
alias gl='git log --graph --oneline --all'
alias gc='git commit'
alias ga='git add'
alias gf='git fixup'
alias gca='git commit --amend'
alias gcan='git commit --amend --no-edit'
alias gp='git push origin $(git rev-parse --abbrev-ref HEAD)'
alias gpf='git push -f origin $(git rev-parse --abbrev-ref HEAD)'
alias ghb='gh browse'

alias curltime="curl -w \"@$HOME/.curl-format.txt\" -o /dev/null -s "

# libpq
export PATH="$(brew --prefix)/opt/libpq/bin:$PATH"
export PKG_CONFIG_PATH="$(brew --prefix)/opt/libpq/lib/pkgconfig"

export PATH="$HOME/.docker/bin:$PATH"

# openssl
export LDFLAGS="-L/opt/homebrew/opt/openssl@3/lib"
export CPPFLAGS="-I/opt/homebrew/opt/openssl@3/include"

# Always use Tmux
  if [[ -z "$TMUX" && -z "$VIM" ]]
  then
    session_num=$(
      tmux list-sessions |
      grep -v attached |
      grep -oE '^\d+:' |
      grep -oE '^\d+' |
      head -1
    )
    if test $session_num
    then
      exec tmux attach -t $session_num
    else
      exec tmux -u
    fi
  fi

# autocompletion from brew
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$(brew --prefix)/share/zsh/site-functions:$FPATH
fi

# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='ag -s -g ""'

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

export PATH="$HOME/.local/bin:$PATH"

export PATH="$HOME/.poetry/bin:$PATH"
export PATH=$(pwd)/bin:$PATH

export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

function git_prompt_info() {
    ref=$(git-branch-name -q -h 12 -b 64) || return
    echo "${ZSH_THEME_GIT_PROMPT_PREFIX}${ref}${ZSH_THEME_GIT_PROMPT_CLEAN}${ZSH_THEME_GIT_PROMPT_SUFFIX}"
}

export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

eval "$(direnv hook zsh)"

# Add JBang to environment
alias j!=jbang
export PATH="$HOME/.jbang/bin:$PATH"

# Rust bin
export PATH="$HOME/.cargo/bin:$PATH"

export GPGKEY=1FBCF0B7786FEC2D

. ~/.asdf/plugins/java/set-java-home.zsh
. "$HOME/.cargo/env"

# BEGIN opam configuration
# This is useful if you're using opam as it adds:
#   - the correct directories to the PATH
#   - auto-completion for the opam binary
# This section can be safely removed at any time if needed.
[[ ! -r '/Users/magus/.opam/opam-init/init.zsh' ]] || source '/Users/magus/.opam/opam-init/init.zsh' > /dev/null 2> /dev/null
# END opam configuration
