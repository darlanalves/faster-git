# faster-git

My bash aliases to make SCM life easier/faster on a terminal

## Usage

Run the following git command, then add an alias to your settings:

`git config --edit --global`

```bash
[alias]
        recommit = "commit --amend --no-edit"
        wip = "commit -m 'chore: wip'"
```

Then just copy the content of `faster-git.sh` to your `~/.bashrc` or `~/.profile`:

## Examples in a git-flow

```
$ gs                        # show status

        On branch master
        Your branch is up to date with 'origin/master'.

        nothing to commit, working tree clean

$ gb feat/new-feature       # create branch
        Switched to a new branch 'feat/new-feature'

$ gco master                # go back to master

        Switched to branch 'master'
        Your branch is up to date with 'origin/master'.

$ gco feat                 # checkout to a branch that matches 'feat'
        Switched to branch 'feat/new-feature'

$ gbp                      # push branch to remote

        # -- apply your changes --

$ gfp                      # adds your changes, recommit and force push to remote

$ grm                      # fetch latest master and rebase on top of it

        # -- if needed, resolve conflicts --

$ grc                      # mark conflict resolutions and continue rebasing

```

All commands should be easy to follow if you're used to git.
