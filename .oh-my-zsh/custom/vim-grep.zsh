function vim-grep () {
    vim $(grep -Rl "$@" ./*)
}

#Not a vim tip exclusively, but I have a great bash command I use really frequently for quickly opening files in a big project by grepping for strings that I know to be unique to that file. It can also be useful for simple refactoring where an IDE is not necessary. I creatively named it vim-grep
#Incredibly simple, but in a large project instead of
#$ vim src/com/mycompany/project/v1/tpsreportgen/model/TpsModel.java
#I can use
#$ vim-grep "class TpsModel"
#If I dropped the 'class' from the search I would immediately have a command to edit all files that have TPSModel imported into them as well.