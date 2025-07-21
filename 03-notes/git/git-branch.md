# GIT thing

That thing that you want to do in GIT when you want to back out a commit is RESET. Find the most recent commit that you like and reset to it with hard-changes, which will delete the commits above it, including the change.

I assume that soft reset will keep the changes but uncommitted.

## Switch vs Checkout

Generally, you will want to use git switch as that replaced checkout as the default / preferred command in 2020.

However git checkout does effectively do two things, it git switches and then also git restore working working tree files.

I am still not sure how to switch to the remote branch?

- Ignore this, it was easy, you probably just missed running git fetch --all first.
