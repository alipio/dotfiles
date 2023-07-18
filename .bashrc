# ~/.bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Allow <C-s> to pass through to shell and programs
stty -ixon

for dotfile in "$XDG_CONFIG_HOME"/bashrc.d/{function,path,env,alias,completion,grep,prompt,asdf,rails,custom}; do
  [ -f "$dotfile" ] && . "$dotfile" || true
done
