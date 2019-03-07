# faster-git

My bash aliases to make SCM life easier/faster on a terminal

## Usage

Run the following git command, then add an alias to your settings:

`git config --edit --global`

```
[alias]
        recommit = "commit --amend --no-edit"
        wip = "commit -m 'chore: wip'"
```

Then just copy the content below and add to `~/.bashrc` or `.profile`:

```bash
alias gs="git status"
alias gb="git checkout -b"
alias grm="git fetch && git rebase origin/master"
alias gbp="git push origin \$(git symbolic-ref --short HEAD) -u --no-verify"
alias gfp="git add -A && git recommit && git push origin \$(git symbolic-ref --short HEAD) -u --no-verify -f"
alias grc="git add -A && git rebase --continue"

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

```

## Examples in a git-flow

```
$ gs                        # show status

On branch master
Your branch is up to date with 'origin/master'.

nothing to commit, working tree clean

$ gb feat/new-feature       # create branch
Switched to a new branch 'test'

$ gco master                # go back to master

Switched to branch 'master'
Your branch is up to date with 'origin/master'.

$ gco feat                 # checkout to a branch that matches 'feat'
Switched to branch 'feat/new-feature'

$ gbp                      # push branch to remote

# do some changes

$ gfp                      # adds your changes, recommit and force push to remote

$ grm                      # fetch latest master and rebase on top of it

# if needed, resolve conflicts

$ grc                      # mark conflict resolutions and continue rebasing

```

All commands should be easy to follow if you're used to git
