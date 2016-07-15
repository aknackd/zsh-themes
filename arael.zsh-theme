local return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"

PROMPT='%{$FG[166]%}%n%{$reset_color%} at %{$FG[070]%}%m%{$reset_color%} in %{$FG[063]%}%1~%{$reset_color%} $(git_prompt_info)%{$reset_color%}%B→%b '
RPS1="${return_code}"

ZSH_THEME_GIT_PROMPT_PREFIX="on ⦗%{$FG[228]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}⦘ "
