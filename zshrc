export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

export EDITOR=/usr/bin/nvim
export COLORTERM=truecolor

eval $($(brew --prefix)/bin/brew shellenv)

source $(brew --prefix)/share/antigen/antigen.zsh
antigen use oh-my-zsh

antigen bundles <<EOBUNDLES
aws
bundler
git
github
git-prompt
ruby
zsh-users/zsh-completions src
zsh-users/zsh-syntax-highlighting
skywind3000/z.lua
EOBUNDLES
antigen theme lunks/minimim
antigen apply

# asdf
export ASDF_DIR=$(brew --prefix asdf)/libexec
. $(brew --prefix asdf)/libexec/asdf.sh

# local stuff
[ -f ~/.zshrc.local ] && source ~/.zshrc.local

# aliases
alias j=z
alias plug="nvim +PlugInstall +PlugUpdate +PlugClean!"
alias v="nvim"
alias vi="nvim"
alias vim="nvim"
alias cat="bat"
alias glb="git for-each-ref --count=5 --sort=-committerdate refs/heads/ --format='%(color:yellow)%(refname:short)%(color:reset) %0a %(subject)'"
alias gs='git status'
alias gl='git log --graph --oneline --all'
alias gc='git commit'

# libpq
export PATH="$(brew --prefix)/opt/libpq/bin:$PATH"
export LDFLAGS="-L$(brew --prefix)/opt/libpq/lib"
export CPPFLAGS="-I$(brew --prefix)/opt/libpq/include"
export PKG_CONFIG_PATH="$(brew --prefix)/opt/libpq/lib/pkgconfig"

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
    exec tmux
  fi
fi

# autocompletion from brew
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH
fi

# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='ag -s -g ""'


# docker rm $(docker ps -a -q)

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

export PATH="$HOME/.poetry/bin:$PATH"
