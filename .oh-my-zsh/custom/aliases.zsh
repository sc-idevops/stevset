#Readability aliases
alias lss='ls -alh --color=auto'
alias mount='mount |column -t'
alias df='df -H'
#Shell Function aliases
alias dirs="dirs -v"
alias h='history'
alias j='jobs -l'
#shortcuts aliases
alias ping='ping -c 5'
alias ax="chmod a+x"
alias wmip="curl icanhazip.com"
#git aliases
alias gitS='git status'
alias gitL='git log'
alias gitD='git diff'
#Apt aliases
alias aptup="sudo apt update && sudo apt upgrade"
alias aptrm="sudo apt autoremove && sudo apt autoclean"
#Combo aliases
mcd() { mkdir -p "$1"; cd "$1";} #make a directory and cd into it
cls() { cd "$1"; ls;} #cd into directory and list contents
md5check() { md5sum "$1" | grep "$2";} #md5sum file, compare to md5sum as second parameter

