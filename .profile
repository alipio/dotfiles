#!/usr/bin/env bash

export PATH="$HOME/.local/bin:$PATH"
export LANG='en_US.UTF-8'
export EDITOR='vim'
export PAGER='less'
export TERMINAL='st'
export TERMINAL_PROG='st'
export BROWSER='librewolf'
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export XINITRC="$XDG_CONFIG_HOME/xsession/xinitrc"
export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc-2.0"
export WGETRC="$XDG_CONFIG_HOME/wget/wgetrc"
export INPUTRC="$XDG_CONFIG_HOME/inputrc"
export LESSHISTFILE="-"
export TMUX_TMPDIR="$XDG_RUNTIME_DIR"
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export GOPATH="$XDG_DATA_HOME/go"
export ASDF_CONFIG_FILE="$XDG_CONFIG_HOME/asdf/asdfrc"
export ASDF_DIR=/opt/asdf-vm
export ASDF_DATA_DIR="$XDG_DATA_HOME/asdf"
export ASDF_GEM_DEFAULT_PACKAGES_FILE="$XDG_CONFIG_HOME/asdf/default-gems"
export GEMRC="$XDG_CONFIG_HOME/gem/gemrc"
export GEM_SPEC_CACHE="$XDG_CACHE_HOME/gem/specs"
export GIT_TEMPLATE_DIR="$XDG_CONFIG_HOME/git/template"
export BUNDLE_USER_HOME="$XDG_CACHE_HOME/bundle"
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"
export NPM_CONFIG_CACHE="$XDG_CACHE_HOME/npm"
export DOCKER_CONFIG="$XDG_CONFIG_HOME/docker"
export PSQLRC="$XDG_CONFIG_HOME/psqlrc"
export FZF_DEFAULT_OPTS='--layout=reverse --height 40%'
export LESS=-XRi
export LESS_TERMCAP_mb="$(printf '\e[1;31m')"
export LESS_TERMCAP_md="$(printf '\e[1;36m')"
export LESS_TERMCAP_me="$(printf '\e[0m')"
export LESS_TERMCAP_so="$(printf '\e[01;44;33m')"
export LESS_TERMCAP_se="$(printf '\e[0m')"
export LESS_TERMCAP_us="$(printf '\e[1;32m')"
export LESS_TERMCAP_ue="$(printf '\e[0m')"
export QT_QPA_PLATFORMTHEME='gtk2'
export MOZ_USE_XINPUT2='1'
export AWT_TOOLKIT='MToolkit wmname LG3D'
export _JAVA_AWT_WM_NONREPARENTING=1 # Fix for Java applications in dwm.

eval $(dircolors -b "$XDG_CONFIG_HOME/dir_colors")

# Start graphical server on user's current tty if not already running.
[ "$(tty)" = "/dev/tty1" ] && ! pidof -s Xorg >/dev/null 2>&1 && exec startx "$XINITRC"
