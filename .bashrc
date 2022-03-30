# .bashrc

# exit if not interactive
[[ $- != *i* ]] && return

# terminal formatting
alias ls='ls -a --color=auto'
PS1='\e[95m\W\e[m → '
