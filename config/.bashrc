# ~/.bashrc: executed by bash(1) for non-login shells.

# Note: PS1 and umask are already set in /etc/profile. You should not
# need this unless you want different defaults for root.
# PS1='${debian_chroot:+($debian_chroot)}\h:\w\$ '
# umask 022

export TERM=xterm

# You may uncomment the following lines if you want `ls' to be colorized:
export LS_OPTIONS='--color=auto'
eval "`dircolors`"
alias ls='ls $LS_OPTIONS'
alias ll='ls $LS_OPTIONS -l'
alias l='ls $LS_OPTIONS -lA'
#
# Some more alias to avoid making mistakes:
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

alias php='hhvm -d hhvm.jit=0 '
alias phpunit='hhvm -d hhvm.jit=0 /usr/local/bin/phpunit'
alias composer='hhvm -d hhvm.jit=0 /usr/local/bin/composer'

export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

echo "Welcome to nginx-hhvm-docker:latest"
echo "-----------------------------------"
echo "Production ready & lightning fast"