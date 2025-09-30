# Ideas for future teaching of environments

## Environments first

Like, project environments first, then stacked environments, don't install a
package without knowing where you install it and why you choose to install it
there.

## Demonstrate a package getting updated

To demonstrate the utility and functionality of version controlled environments.

- Have an example package with a good example bug
    - Hello function printing without line ending
- Learners install this and write a loop with a workaround
- (TA installs this in the background)
- Publish fix
- Learners update, remove their workaround, use git to go back and forth
- TA demonstration:
    - `dev`, fixing the bug
    - looking at the update and finding it good
    - go back to tracking normally
    - Possibly tricky: there's a git repo within a git repo here, I'm not sure
      how convoluted it is to keep full reproducibility when doing this.

