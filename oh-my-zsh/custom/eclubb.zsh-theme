if [[ -n $SSH_CONNECTION ]]; then
  SSH_PROMPT=%n@%m:
else
  SSH_PROMPT=
fi

PATH_PROMPT=%{$fg[cyan]%}%~
END_PROMPT=%(?.%{$fg[green]%}.%{$fg[red]%})$%{$reset_color%}

PROMPT=$'$SSH_PROMPT$PATH_PROMPT %{$reset_color%}$(git_prompt_info)$END_PROMPT '

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[green]%}["
ZSH_THEME_GIT_PROMPT_SUFFIX="]%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[red]%}*%{$fg[green]%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""
