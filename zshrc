ZSH=$HOME/.oh-my-zsh

ZSH_THEME="eclubb"

DISABLE_AUTO_UPDATE="true"
CASE_SENSITIVE="true"

plugins=(bundler gem rails3 yum eclubb)

source $ZSH/oh-my-zsh.sh

if [ -f /usr/local/share/chruby/chruby.sh ] ; then
  source /usr/local/share/chruby/chruby.sh
fi

if [ -f /usr/local/share/chruby/auto.sh ] ; then
  source /usr/local/share/chruby/auto.sh
fi

export EDITOR='vim'
