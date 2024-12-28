GREEN="%{$fg_bold[green]%}"
YELLOW="%{$fg_bold[yellow]%}"
CYAN="%{$fg_bold[cyan]%}"
BLUE="%{$fg_bold[blue]%}"
RED="%{$fg_bold[red]%}"
RESET="%{$reset_color%}"

# Replace /foo/bar/baz with /f/b/baz
prompt_shrink_path() {
    local path="${1}"
    setopt local_options
    setopt extended_glob
    printf %s "${path//(#b)([^\/])[^\/]#\//${match[1]}/}"
}
prompt_cwd() {
    prompt_shrink_path "$(print -P %~)"
}

# Conditionally display the number of jobs and exit code
show_jobs_and_exit_code() {
    # If there's at least one job AND the exit code is non-zero, display ${num_jobs}:${exit_code}
    # Otherwise if exit code is non-zero, display ${exit_code}
    printf %s "%(1j.%(0?. ${BLUE}%j${RESET}. ${BLUE}%j${YELLOW}:${RED}%?${RESET}).%(0?.. ${RED}%?${RESET}))"
}

PROMPT='$CYAN%m$RESET $YELLOW$(prompt_cwd)$(git_prompt_info)$RESET$(show_jobs_and_exit_code) > '

ZSH_THEME_GIT_PROMPT_PREFIX=" ${GREEN}$(printf "\ue725") ${CYAN}"
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_DIRTY=" $RED±$RESET"
ZSH_THEME_GIT_PROMPT_CLEAN=" $GREEN✓$RESET"
