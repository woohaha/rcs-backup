#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias ll='ls -lh --color=auto'
PS1='[\u@\h \W]\$ '

 
 
# i want my grep to color my search word and exclude my grep command
alias grep='grep -v grep | grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias msfconsole='/opt/metasploit/msf3/msfconsole'
export EDITOR="vim"

mgdir(){
	mkdir -p "$@" && cd "$_"
}
