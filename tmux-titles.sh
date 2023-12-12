export TT_MODE=DIR

__tmux_title() {

    # ignore if mode is empty or equals "OFF"
  if [ -z "$TMUX_PANE" ] || [ -z "$TT_MODE" ] || [ "$TT_MODE" = "OFF" ]; then
    return
  fi

  # use git repository name if possible
  if $(git rev-parse --is-inside-work-tree 2>/dev/null); then
    vcs_origin_url="$(git ls-remote --get-url origin)"
    vcs_basename="$(basename "$vcs_origin_url" .git)"
    tmux rename-window -t "${TMUX_PANE}" "[ $vcs_basename ]"
    return
  fi

  # otherwise use folder name, supporting tilde notation
  local pwd="${PWD/#$HOME/\~}"
  local path=""
  case $TT_MODE in
    "DIR")
      path=$(basename "$pwd");;
    "PARENT")
      if [ $pwd = "~" ]; then
        path=$pwd
      elif [  $(basename "$(dirname "$pwd")") = "/" ]; then
        path=$pwd
      else
        path=$(basename "$(dirname "$pwd")")/$(basename "$pwd")
      fi;;
    "PWD")
      path=$pwd;;
    *)
      path="??<$TT_MODE>??";;
  esac
  tmux rename-window -t "${TMUX_PANE}" "$path"

}

ttdir() {
  export TT_MODE=DIR
}

ttparent() {
  export TT_MODE=PARENT
}

ttpwd() {
  export TT_MODE=PWD
}

ttoff() {
  export TT_MODE=OFF
  tmux rename-window -t "${TMUX_PANE}" ""
}

ttset() {
  export TT_MODE=OFF
  tmux rename-window -t "${TMUX_PANE}" "$1"
}
