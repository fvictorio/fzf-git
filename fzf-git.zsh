# useful git fzf suggestions with ^G
fzf-git() {
  local tokens
  tokens=(${(z)LBUFFER})
  # when using git checkout, show the list of recent branches (using reflog)
  # otherwise, show modified files
  if [ "${tokens[1]}" = "gco" ] || ([ "${tokens[1]}" = "git" ] && [ "${tokens[2]}" = "checkout" ]); then
    LBUFFER="${LBUFFER}$(git reflog | grep 'moving from' | sed -E 's/.*moving from (\S*).*/\1/' | awk '!seen[$0]++' | fzf --reverse --preview-window='right:60%' --border --preview 'git log -n 1 --format=%Cblue%h\ %Creset%s {+1}')"
  else
    local result=$(git status -s | awk '{print $2}' | fzf --reverse --multi | while read item; do echo -n "${(q)item} "; done)
    LBUFFER="${LBUFFER}${result}"
  fi
  local ret=$?
  zle reset-prompt
  return $ret
}
bindkey '^G' fzf-git
zle -N fzf-git
