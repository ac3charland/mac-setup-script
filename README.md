# Mac Setup Script

## Summary
This repo is meant to streamline the setup process when setting up a new Mac for work, a new client, etc. It follows [Pawel Grzybek's excellent article](https://pawelgrzybek.com/change-macos-user-preferences-via-command-line/) on how to use the `defaults` command to change your Mac's System Preferences via the Terminal. It also includes instructions for other manual setup tasks, to take the guesswork out of the setup process. This script is specific to my own tastes, but should serve as a template for anyone interested in modifying it for their own use.

## Instructions
1. Once you've downloaded and unzipped this repo, open the Terminal application and run `sh setup.sh` in the project directory.
    - You can also perform the manual steps below after running `setup-preferences.sh`
1. Restart the computer for the changes to take effect.

### Full Manual Steps
1. Run `setup-preferences.sh` and restart your computer.
1. Install [Homebrew](https://brew.sh/) by running `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`
    - This will also install Command Line Tools, which will allow you to run `git` commands
1. Download & unzip the [anachronistally-named BashProfile](https://github.com/ac3charland/BashProfile) to your location of choice
1. Set up Developer tools
    - In Terminal, run `git`
    - You will be prompted to install developer tools. Install them.
1. [Set up Terminal style](https://inspirnathan.com/posts/22-install-ohmyzsh-with-agnoster-theme/):
    1. Install oh-my-zsh by running:
        ```
        sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
        ```
    1. Update `.zshrc` with the following:
        1. Add `source path/to/BashProfile/profile.sh` to top
        1. Change theme to `ZSH_THEME="agnoster"`
        1. Add `export DEFAULT_USER="$(whoami)"` under User Configuration to remove username from terminal
    1. Install needed Agnoster fonts:
        1. In the home directory run: 
            ```
            git clone https://github.com/powerline/fonts.git
            ```
        1. Run:
            ```
            cd fonts && ./install.sh
            ```
        1. Cleanup:
            ```
            cd .. && rm -rf fonts
            ```
    1. Open `Terminal > Preferences > Profiles > (...) > Import` and import the `Agnoster.terminal` file included in this repo. Set it to default. This will set the correct font, size, color, etc.
    1. Restart the Terminal.
1. Set up work email/calendars
1. Install [nvm](https://github.com/nvm-sh/nvm) with `curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash`
1. Install Node with `nvm i 14` (or whatever version you want)
1. Set up personal Git credentials
    - [Generate an SSH Key](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent) by running the following: `ssh-keygen -t ed25519 -C "your_email@example.com"`
    - Copy the key to your clipboard by running `pbcopy < ~/.ssh/id_ed25519.pub`
    - Add the key to your [Github Profile](https://github.com/settings/keys)
1. Download [VSCode for Mac](https://code.visualstudio.com/download)
1. Open VSCode and in the dock right click to select "Keep in Dock"
1. In VSCode, hit `Cmd + Shift + P` to open the Command Pallette and search `Shell Command: Install 'code' command in PATH`. Run this to set up the `code` terminal command.
1. Install the following VSCode Extensions:
    - IntelliJ IDEA Keybindings by Keisuke Kato
    - GitLens by GitKraken
    - Jest by Orta
    - Better Comments by Aaron Bond
    - Prettier
1. Add manual VSCode keyboard shortcut changes:
    - Delete double-shift IntelliJ shortcut by opening Code > Preferences > Keyboard Shortcuts and searching "shift shift". Delete the shortcuts corresponding to "Go to File..."
    - Delete `Cmd + Shift + W` binding for Close Window and assign to `gitLens.openFileOnRemote`
1. Turn auto save on by going to Preferences > Settings > Search "auto safe"
1. Remove apps from the dock that you don't use, such that the remaining apps are:
    - Chrome
    - VSCode
    - Terminal
    - Mail (or Outlook)
    - Calendar
    - System Preferences

