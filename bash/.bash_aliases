#Readability aliases
if which exa > /dev/null; then
  alias lss='exa -alh'
else
  alias lss='ls -alh --color=auto'
fi
alias mount='mount |column -t'
alias df='df -H -x squashfs -x tmpfs -x devtmpfs'
alias bat=batcat
alias ncdu='ncdu --color dark'

#Shell Function aliases
alias dirs="dirs -v"
alias h='history'
alias jb='jobs -l'
alias reload=". ~/.bashrc"

#shortcuts aliases
alias please="sudo !!"
alias ping='ping -c 5'
alias ax="chmod a+x"
alias wmip="curl icanhazip.com"

#git aliases
alias gitS='git status'
alias gitL='git log'
alias gitD='git diff'
alias gitC='git commit -a'

#Apt aliases
alias aptup="sudo apt update && sudo apt full-upgrade"
alias aptrm="sudo apt autoremove && sudo apt autoclean"

#ssh aliases
alias sagent="eval `ssh-agent`"
