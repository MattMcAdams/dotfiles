# MattMcAdams' simple ZSH prompt

# Inspired by Matthieu Cneude
# https://github.com/Phantas0s/purification

# prompt:
# %F => color dict
# %f => reset color
# %~ => current path
# %* => time
# %n => username
# %m => shortname host
# %(?..) => prompt conditional - %(condition.true.false)

prompt_config() {
  # Display git status
  __git_prompt_status() {
    local INDEX TRACKING AHEAD BEHIND STATUS EDITS

    INDEX=$(git status --porcelain 2> /dev/null)
    TRACKING=$(git rev-parse --abbrev-ref @{upstream} 2>&1)
    AHEAD=$(git rev-list HEAD@{upstream}..HEAD 2> /dev/null | wc -l | awk '{$1=$1};1')
    BEHIND=$(git rev-list HEAD..HEAD@{upstream} 2> /dev/null | wc -l | awk '{$1=$1};1')
    STATUS=""
    EDITS=$(echo $INDEX | wc -l | awk '{$1=$1};1')

    if $(command git rev-parse --verify refs/stash &>/dev/null); then
      STATUS="%F{cyan}↩︎%f $STATUS"
    fi

    if $(echo "$TRACKING" | grep 'no upstream' &> /dev/null); then
      STATUS="%F{yellow}⌂%f $STATUS"
    elif $(echo "$TRACKING" | grep '@{upstream}' &> /dev/null); then
      STATUS="%B%F{red}!%f%b $STATUS"
    else
      if [[ $AHEAD -gt 0 ]]; then
        STATUS="$STATUS$AHEAD%F{green}↑%f "
      fi
      if [[ $BEHIND -gt 0 ]]; then
        STATUS="$STATUS$BEHIND%F{red}↓%f "
      fi
    fi

    if [[ ! -z "$INDEX" ]]; then
      STATUS="$STATUS$EDITS%B%F{blue}*%f%b "
    fi

    if [[ ! -z "$STATUS" ]]; then
      echo "$STATUS"
    fi
  }

  __prompt_git_branch() {
    autoload -Uz vcs_info
    precmd_vcs_info() { vcs_info }
    precmd_functions+=( precmd_vcs_info )
    setopt prompt_subst
    zstyle ':vcs_info:git:*' formats '%b'
  }

  __prompt_git_info() {
    [ ! -z "$vcs_info_msg_0_" ] && echo "[ $vcs_info_msg_0_ $(__git_prompt_status)]"
  }

  # This sets up some fancier formatting for the path
  # ${(%):-%~} is the full path.
  # ${(%):-%1~} is the last item in the path.
  # %B${(%):-%1~}%b is the styled version of the last item in the path
  # The slashes perform a substitution: source/find/replace
  # Each time a substitution happens, the previous one much be wrapped in ${}
  # This entire string also has to be wrapped in ${}
  ZSH_PROMPT_PATH='${${${${(%):-%~}/${(%):-%1~}/ %B${(%):-%1~}%b}/ %B${(%):-%-1~}%b/%B${(%):-%-1~}%b}//\//%B%F{cyan\}/%f%b}'

  __prompt_precmd() {
    # Pass a line before each prompt
    print -P ''
    # Enable only for multiline prompt
    print -rP $ZSH_PROMPT_PATH
  }

  # Add precmd hooks
  autoload -Uz add-zsh-hook
  add-zsh-hook precmd __prompt_precmd
  # Format git branch and general git support
  __prompt_git_branch

  RPROMPT='$(__prompt_git_info) %t'
  # PROMPT="$ZSH_PROMPT_PATH %B%F{cyan}❯%f%b "
  # Enable only for multiline prompt
  PROMPT="%n @ %m %B%F{cyan}❯%f%b "
}
