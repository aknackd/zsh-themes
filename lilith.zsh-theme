function _user_host() {
    if [[ -n $SSH_CONNECTION ]]; then
        local me="%n@%m"
    elif [[ $LOGNAME != $USER ]]; then
        local me="%n"
    fi

    [[ -n $me ]] && echo "[%{$FG[288]%}$me%{$reset_color%}] "
}

local return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"

PROMPT='%{$fg[red]%}☨%{$reset_color%} $(_user_host)%{$FG[063]%}%~%{$reset_color%} $(git_prompt_info)%{$reset_color%}%B '
RPS1="${return_code}"

ZSH_THEME_GIT_PROMPT_PREFIX="%{$FG[228]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[red]%}✗%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[white]%}◒ "
ZSH_THEME_GIT_PROMPT_CLEAN=" "
