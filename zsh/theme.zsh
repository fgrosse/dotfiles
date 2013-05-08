# theme based on
# https://github.com/robbyrussell/oh-my-zsh/blob/master/themes/arrow.zsh-theme

autoload -Uz colors && colors

# Git prompt
# taken from http://henrik.nyh.se/2008/12/git-dirty-prompt
function parse_git_dirty {
  [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit, working directory clean" ]] && echo "%B%{$fg[yellow]*%}%b"
}

function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/ %{$fg[white]%}%B[\1%b$(parse_git_dirty)%B%{$fg[white]%}]%b/"
}


update_prompt() {
  local usr
  # show a different color for root
  if [ $UID -eq 0 ]; then
    usr="%B%{$fg[red]%}%n%{$reset_color%}%b"
  else
    usr="%B%{$fg[white]%}%n%{$reset_color%}%b"
  fi

  machine="%B%{$fg[white]%}%m%{$reset_color%}%b"

  PROMPT="%(?..%{$fg[red]%}[%?]%{$reset_color%} )$usr@$machine:%~$(parse_git_branch) %{$fg[white]%}%B➤%b %{$reset_color%}"
  RPROMPT="[%B%*%b on %D]"
}

add-zsh-hook precmd update_prompt

