# .bashrc

# gen/bashrc
. $HOME/.glue/.bashrc

# exit if not interactive
[[ $- != *i* ]] && return

# aliases
alias ls='ls -a --color=auto'

# prompt
branch () { if git ls-files >& /dev/null ; then echo " ($(git symbolic-ref --short --quiet HEAD))" ; fi ; }
PS1="\e[95m\W\e[94m\$(branch)\\e[m → "

# motd
motd () {
	echo -e "\e[32m$1 \e[39m$2\e[0m"
}
motd "time  " "$(date +"%A, %H:%M %Z")"
motd "date  " "$(date +"%d %B %Y")"
motd "uptime" "$(awk '{print int($1/60/60)" hours "int($1/60%60)" minutes "int($1%60%60)" seconds"}' /proc/uptime)"
echo ""

# title
title () {
	#local last=$(history 1 | sed "s/.[ ]*.[0-9]*.[ ]*//")
	local dir=$(echo $PWD | sed -e "s|$HOME|~|")
	#if [[ "$branch" ]] ; then local branch="branch $branch @ " ; fi
	echo -en "\033]0;$dir$(branch)\a"
}
case "$TERM" in xterm*|rxvt*) export PROMPT_COMMAND="title" ;; *) ;; esac
