killport() {
  lsof -ti:$1 | xargs kill
}

alias gs="git status"
alias grm="git fetch && git rebase origin/master"
alias gbp="git push origin \$(git symbolic-ref --short HEAD) -u --no-verify"
alias gfp="git add -A && git recommit && git push origin \$(git symbolic-ref --short HEAD) -u --no-verify -f"
alias grc="git add -A && git rebase --continue"
alias gtree="git log --graph --full-history --all --color  --pretty=format:\"%x1b[31m%h%x09%x1b[32m%d%x1b[0m%x20%s\""

git config --global alias.recommit 'commit --amend --no-edit'

gb() {
  if [ -z "$1" ]; then
    git branch;
  else
    git checkout -b $1;
  fi
}

gco() {
  BRANCHES=`git for-each-ref --format="%(refname:short)" refs/heads | grep $1`
  BRANCHES_COUNT=`git for-each-ref --format="%(refname:short)" refs/heads | grep $1 | wc -l`
  if [ $BRANCHES_COUNT -gt 1 ]; then
    echo "Too many matches:";
    for branch in $BRANCHES; do echo "  $branch"; done
    return 0
  elif [ $BRANCHES_COUNT -eq 1 ]; then
    git checkout $BRANCHES
  else
    echo "Not found"
  fi
}

git_branch() {
    git symbolic-ref --short HEAD 2> /dev/null
}

git_list_branches() {
    git for-each-ref refs/heads --format='%(refname)' | cut -d/ -f3-
}

ga() {
  PATTERN=$1
  CHANGES=$(git ls-files -m | grep $PATTERN -)
  for file in $CHANGES; do
    echo "+  $file";
    git add $file
  done
}
