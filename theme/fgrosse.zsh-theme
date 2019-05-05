#!/usr/bin/env zsh

current_activity() {
  if [[ -x "$(which track &> /dev/null)" ]]; then
    name=$(track print "{{ .Current.Name }}")
    if [[ -n "$name" ]]; then
      track print "[ %{$fg_bold[white]%}{{ .Current.Name }}%{$reset_color%} | {{ .Current | duration }} ]"
    fi
  fi
}

host=$HOST
if [ -n "$host" ]; then
  host="%{$fg_bold[yellow]%}$host%{$reset_color%} "
fi

PROMPT='
$host%{$fg_bold[green]%}${PWD/#$HOME/~}%{$reset_color%}$(git_prompt_info) ⌚ %{$fg_bold[red]%}%*%{$reset_color%} $(current_activity)
$ '

# Must use Powerline font, for \uE0A0 to render.
# TODO: only use funky character if support on this host
# Can be tested via:
# if [[ "$(echo "\uE0A0" 2>&1)" == *"character not in range" ]]; then echo "NOPE"; else echo "OK"; fi

ZSH_THEME_GIT_PROMPT_PREFIX=" on %{$fg[magenta]%}\uE0A0 "
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}!"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[green]%}?"
ZSH_THEME_GIT_PROMPT_CLEAN=""
