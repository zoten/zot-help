# Code Workshops

I was writing a workshop, divided in chapters with git commits for each one. This is my workflow for amendments

``` bash
# 1) Add a detached worktree at Chapter 2
git worktree add --detach ../ch2-fix <sha_of_chapter_2>
cd ../ch2-fix
git switch -c fix/ch2   # create a temp branch at the ch2 point

# 2) Make your edits as they should exist in Chapter 2
git add -A
git commit --fixup=<sha_of_chapter_2>

# 3) Bring the fixup commit to your main branch tip
# (grab the new commit sha)
git log -1 --oneline
# back to your main repo
cd -  # return to original worktree
git cherry-pick <new_fixup_sha>  # applies cleanly on top of current tip

# 4) Autosquash it in place
git rebase -i --autosquash --root
```

Fewer conflicts, good rebase experience
