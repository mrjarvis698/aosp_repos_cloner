# aosp_repos_cloner
## gh Installation
`gh` is GitHub on the command line. It brings pull requests, issues, and other GitHub concepts to the terminal next to where you are already working with `git` and your code.
[For More Info](https://github.com/cli/cli)

Copy Paste below in Linux Terminal (ubuntu distro):
`sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-key C99B11DEB97541F0 && sudo apt-add-repository https://cli.github.com/packages && sudo apt update && sudo apt install gh -y`

## gh Authentication
Copy Paste: `gh auth login --web`: this will generate 8-digit Code used for authentication.

Now Press Enter to open a link in browser/copy link paste in your local pc for authentication.

Now Github link asks for 8-digit code generated in terminal.

Enter 8-digit code and proceed further, now give Permissions to authenticate.

Now it will echo a terminal msg:

`✓ Authentication complete. Press Enter to continue...` press enter,

`✓ Logged in as "Your Github Username"` and Done

## Variables In clone.sh
`git_username_from`,`git_username_to`,`repo_branch`
Read it Carefully "YOU ARE NOT A NOOB". So, its easy to find what should assign in respective variable.

## Important things
- `gitpod` variable keep it to `yes`, gitpod can access private repo without ssh and it works on simple http requests.

- `ssh` should be there to clone and push to private repos.

- add an extra empty line in `repo_list` file after adding all repos list.
