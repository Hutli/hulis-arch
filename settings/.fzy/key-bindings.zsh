#     ____      ____
#    / __/___  / __/
#   / /_/_  / / /_
#  / __/ / /_/ __/
# /_/   /___/_/ key-bindings.zsh
#
# - $FZY_TMUX_OPTS
# - $FZY_CTRL_T_COMMAND
# - $FZY_CTRL_T_OPTS
# - $FZY_CTRL_R_OPTS
# - $FZY_ALT_C_COMMAND
# - $FZY_ALT_C_OPTS

# Key bindings
# ------------

# The code at the top and the bottom of this file is the same as in completion.zsh.
# Refer to that file for explanation.
if 'zmodload' 'zsh/parameter' 2>'/dev/null' && (( ${+options} )); then
  __fzy_key_bindings_options="options=(${(j: :)${(kv)options[@]}})"
else
  () {
    __fzy_key_bindings_options="setopt"
    'local' '__fzy_opt'
    for __fzy_opt in "${(@)${(@f)$(set -o)}%% *}"; do
      if [[ -o "$__fzy_opt" ]]; then
        __fzy_key_bindings_options+=" -o $__fzy_opt"
      else
        __fzy_key_bindings_options+=" +o $__fzy_opt"
      fi
    done
  }
fi

'emulate' 'zsh' '-o' 'no_aliases'

{

[[ -o interactive ]] || return 0

# CTRL-T - Paste the selected file path(s) into the command line
__fsel() {
  local cmd="${FZY_CTRL_T_COMMAND:-"command find -L . -mindepth 1 \\( -path '*/\\.*' -o -fstype 'sysfs' -o -fstype 'devfs' -o -fstype 'devtmpfs' -o -fstype 'proc' \\) -prune \
    -o -type f -print \
    -o -type d -print \
    -o -type l -print 2> /dev/null | cut -b3-"}"
  setopt localoptions pipefail no_aliases 2> /dev/null
  eval "$cmd" | FZY_DEFAULT_OPTS="--height ${FZY_TMUX_HEIGHT:-40%} --reverse $FZY_DEFAULT_OPTS $FZY_CTRL_T_OPTS" $(__fzycmd) "$@" | while read item; do
    echo -n "${(q)item} "
  done
  local ret=$?
  echo
  return $ret
}

__fzycmd() {
  [ -n "$TMUX_PANE" ] && { [ "${FZY_TMUX:-0}" != 0 ] || [ -n "$FZY_TMUX_OPTS" ]; } &&
    echo "fzy-tmux ${FZY_TMUX_OPTS:--d${FZY_TMUX_HEIGHT:-40%}} -- " || echo "fzy"
}

fzy-file-widget() {
  LBUFFER="${LBUFFER}$(__fsel)"
  local ret=$?
  zle reset-prompt
  return $ret
}
zle     -N   fzy-file-widget
bindkey '^T' fzy-file-widget

# CTRL-H - Paste the selected file path(s) into the command line
__fsel2() {
  local cmd="${FZY_CTRL_T_COMMAND:-"command find -L ~/ -mindepth 1 \\( -path '*/\\.*' -o -fstype 'sysfs' -o -fstype 'devfs' -o -fstype 'devtmpfs' -o -fstype 'proc' \\) -prune \
    -o -type f -print \
    -o -type d -print \
    -o -type l -print 2> /dev/null"}"
  setopt localoptions pipefail no_aliases 2> /dev/null
  eval "$cmd" | FZY_DEFAULT_OPTS="--height ${FZY_TMUX_HEIGHT:-40%} --reverse $FZY_DEFAULT_OPTS $FZY_CTRL_T_OPTS" $(__fzycmd) "$@" | while read item; do
    echo -n "${(q)item} "
  done
  local ret=$?
  echo
  return $ret
}

fzy-file-widget2() {
  LBUFFER="${LBUFFER}$(__fsel2)"
  local ret=$?
  zle reset-prompt
  return $ret
}
zle     -N   fzy-file-widget2
bindkey '^H' fzy-file-widget2

# Ensure precmds are run after cd
fzy-redraw-prompt() {
  local precmd
  for precmd in $precmd_functions; do
    $precmd
  done
  zle reset-prompt
}
zle -N fzy-redraw-prompt

# CTRL-F - cd into the selected directory
fzy-cd-widget() {
  local cmd="${FZY_ALT_C_COMMAND:-"command find -L . -mindepth 1 \\( -path '*/\\.*' -o -fstype 'sysfs' -o -fstype 'devfs' -o -fstype 'devtmpfs' -o -fstype 'proc' \\) -prune \
    -o -type d -print 2> /dev/null | cut -b3-"}"
  setopt localoptions pipefail no_aliases 2> /dev/null
  local dir="$(eval "$cmd" | FZY_DEFAULT_OPTS="--height ${FZY_TMUX_HEIGHT:-40%} --reverse $FZY_DEFAULT_OPTS $FZY_ALT_C_OPTS" $(__fzycmd))"
  if [[ -z "$dir" ]]; then
    zle redisplay
    return 0
  fi
  cd "$dir"
  unset dir # ensure this doesn't end up appearing in prompt expansion
  local ret=$?
  zle fzy-redraw-prompt
  return $ret
}
zle     -N    fzy-cd-widget
bindkey '^F'  fzy-cd-widget

# CTRL-E - Paste the selected command from history into the command line
fzy-history-widget() {
  local selected num
  setopt localoptions noglobsubst noposixbuiltins pipefail no_aliases 2> /dev/null
  selected=( $(fc -rl 1 | perl -ne 'print if !$seen{($_ =~ s/^\s*[0-9]+\s+//r)}++' |
    FZY_DEFAULT_OPTS="--height ${FZY_TMUX_HEIGHT:-40%} $FZY_DEFAULT_OPTS -n2..,.. --tiebreak=index --bind=ctrl-r:toggle-sort $FZY_CTRL_R_OPTS --query=${(qqq)LBUFFER} +m" $(__fzycmd)) )
  local ret=$?
  if [ -n "$selected" ]; then
    num=$selected[1]
    if [ -n "$num" ]; then
      zle vi-fetch-history -n $num
    fi
  fi
  zle reset-prompt
  return $ret
}
zle     -N   fzy-history-widget
bindkey '^E' fzy-history-widget

} always {
  eval $__fzy_key_bindings_options
  'unset' '__fzy_key_bindings_options'
}