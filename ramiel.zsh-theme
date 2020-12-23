GREEN="%{$fg_bold[green]%}"
YELLOW="%{$fg_bold[yellow]%}"
CYAN="%{$fg_bold[cyan]%}"
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

PROMPT='$CYAN%m$RESET $YELLOW$(prompt_cwd)$(git_prompt_info) $RESET'

ZSH_THEME_GIT_PROMPT_PREFIX=" ${GREEN}$(printf "\ufb2b") ${CYAN}"
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_DIRTY=" $RED±$RESET"
ZSH_THEME_GIT_PROMPT_CLEAN=" $GREEN✓$RESET"
