# RVM
if [[ -s ~/.rvm/scripts/rvm ]] ; then source ~/.rvm/scripts/rvm ; fi

setopt prompt_subst
# Enable colors in prompt
autoload -U colors 
colors
# Load completions for Ruby, Git, etc.
autoload compinit
compinit

# Modify the colors and symbols in these variables as desired.
GIT_PROMPT_SYMBOL="⎇"
GIT_PROMPT_AHEAD="↑NUM"
GIT_PROMPT_BEHIND="↓NUM"
GIT_PROMPT_MERGING="∑"
GIT_PROMPT_MODIFIED="*"
GIT_PROMPT_STAGED="+"


# Show Git branch/tag, or name-rev if on detached head
parse_git_branch() {
  (git symbolic-ref -q HEAD || git name-rev --name-only --no-undefined --always HEAD) 2> /dev/null
}

# Show different symbols as appropriate for various Git repository states
git_prompt() {
    local GIT_WHERE="$(parse_git_branch)"
    if [[ -n "$GIT_WHERE" ]]; then
        # Compose this value via multiple conditional appends.
        local GIT_STATE=""
        local GIT_COLOR="%{$fg[blue]%}"

        if ! git diff --quiet 2> /dev/null; then
            GIT_COLOR="%{$fg[yellow]%}"
            GIT_STATE="$GIT_STATE$GIT_PROMPT_MODIFIED"
        fi

        if ! git diff --cached --quiet 2> /dev/null; then
            GIT_COLOR="%{$fg[green]%}"
            GIT_STATE=$GIT_STATE$GIT_PROMPT_STAGED
        fi

        local NUM_AHEAD="$(git log --oneline @{u}.. 2> /dev/null | wc -l | tr -d ' ')"
        if [ "$NUM_AHEAD" -gt 0 ]; then
            GIT_STATE=$GIT_STATE${GIT_PROMPT_AHEAD//NUM/$NUM_AHEAD}
        fi

        local NUM_BEHIND="$(git log --oneline ..@{u} 2> /dev/null | wc -l | tr -d ' ')"
        if [ "$NUM_BEHIND" -gt 0 ]; then
            GIT_STATE=$GIT_STATE${GIT_PROMPT_BEHIND//NUM/$NUM_BEHIND}
        fi

        local GIT_DIR="$(git rev-parse --git-dir 2> /dev/null)"
        if [ -n $GIT_DIR ] && test -r $GIT_DIR/MERGE_HEAD; then
            GIT_COLOR="%{$fg[magenta]%}"
            GIT_STATE="$GIT_STATE$GIT_PROMPT_MERGING"
        fi

        local GIT_STRING="%{$fg_bold[yellow]%}(%{$reset_color%}$GIT_COLOR$GIT_PROMPT_SYMBOL ${GIT_WHERE#(refs/heads/|tags/)}"
        if [[ -n $GIT_STATE ]]; then
            GIT_STRING="$GIT_STRING $GIT_STATE%{$reset_color%}"
        else
            GIT_STRING"$GIT_STRING%{$reset_color%}"
        fi
        echo "$GIT_STRING%{$fg_bold[yellow]%})%{$reset_color%}"
    fi
}

setopt prompt_subst

PROMPT='%{$fg_bold[cyan]%}%n%f%b:%~$(git_prompt) $ '

RPROMPT='%{$fg[yellow]%} $(rvm-prompt)%{$reset_color%}'

# Replace the above with this if you use rbenv
# RPROMPT='%{$fg[white]%} $(~/.rbenv/bin/rbenv version-name)$(~/bin/git-cwd-info.rb)%{$reset_color%}'

# Show completion on first TAB
setopt menucomplete

alias reload="source ~/.zshrc; echo 'reloaded'"
