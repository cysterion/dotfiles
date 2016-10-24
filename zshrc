# RVM
if [[ -s ~/.rvm/scripts/rvm ]] ; then source ~/.rvm/scripts/rvm ; fi







# Adapted from code found at <https://gist.github.com/1712320>.


setopt prompt_subst
autoload -U colors && colors # Enable colors in prompt


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
    # Compose this value via multiple conditional appends.
    local GIT_STATE=" "
    local GIT_COLOR="%{$reset_color%}"

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



    if [[ -n $GIT_STATE ]]; then
        local git_where="$(parse_git_branch)"
        [ -n "$git_where" ] && echo "$GIT_COLOR$GIT_PROMPT_SYMBOL ${git_where#(refs/heads/|tags/)}$GIT_STATE%{$reset_color%}"
    fi


}























# Colors
autoload -U colors
colors
setopt prompt_subst

PROMPT='%n:%~$(git_prompt) %{$reset_color%}'

RPROMPT='%{$fg[yellow]%} $(rvm-prompt)%{$reset_color%}'

# Replace the above with this if you use rbenv
# RPROMPT='%{$fg[white]%} $(~/.rbenv/bin/rbenv version-name)$(~/bin/git-cwd-info.rb)%{$reset_color%}'

# Show completion on first TAB
setopt menucomplete

# Load completions for Ruby, Git, etc.
autoload compinit
compinit
alias reload="source ~/.zshrc; echo 'reloaded'"
