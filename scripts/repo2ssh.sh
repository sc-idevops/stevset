#this command changes the git repo from HTTPS to SSH so you can use the key instead of typing in your password all the time.
USER=steveokard
if [ -n "$1" ] 
then
  git remote set-url origin git@github.com:$USER/$1.git
  git remote -v
else
  echo "the first parameter is the name of the github repo"
fi
