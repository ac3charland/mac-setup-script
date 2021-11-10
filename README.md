# Mac Setup Script

## Summary
This repo is meant to streamline the setup process when setting up a new Mac for work, a new client, etc. It follows [Pawel Grzybek's excellent article](https://pawelgrzybek.com/change-macos-user-preferences-via-command-line/) on how to use the `defaults` command to change your Mac's System Preferences via the Terminal. It also includes instructions for other manual setup tasks, to take the guesswork out of the setup process. This script is specific to my own tastes, but should serve as a template for anyone interested in modifying it for their own use.

## Instructions
1. Once you've downloaded and unzipped this repo, open the Terminal application and run `sh setup-preferences.sh` in the project directory.
1. Restart the computer for the changes to take effect.
1. Download quality-of-life apps:
    - [Rectangle](https://rectangleapp.com/)
    - [Clipy](https://clipy-app.com/)
1. Set up work email/calendars
1. Set up Terminal style:
    In Preferences > Profiles > Homebrew, change font size to 16pt.
1. Set up Developer tools
    - In Terminal, run `git`
    - You will be prompted to install developer tools. Install them.
1. Set up personal Git credentials
    - [Generate an SSH Key](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent) by running the following: `ssh-keygen -t ed25519 -C "your_email@example.com"`
    - Copy the key to your clipboard by running `pbcopy < ~/.ssh/id_ed25519.pub`
    - Add the key to your [Github Profile](https://github.com/settings/keys)
1. Download [VSCode for Mac](https://code.visualstudio.com/download)
1. Open VSCode and in the dock right click to select "Keep in Dock"
1. In VSCode, hit `Cmd + Shift + P` to open the Command Pallette and search `Shell Command: Install 'code' command in PATH`. Run this to set up the `code` terminal command.
1. Install the following VSCode Extensions:
    - IntelliJ IDEA Keybindings by Keisuke Kato
    - Git History by Don Jayamanne
    - Jest Runner by firsttris
    - Better Comments by Aaron Bond
    - ESLint by Dirk Baeumer
1. Delete double-shift IntelliJ shortcut by opening Code > Preferences > Keyboard Shortcuts and searching "shift shift". Delete the shortcuts corresponding to "Go to File..."
1. Remove apps from the doc that you don't use, such that the remaining apps are:
    - Chrome
    - VSCode
    - Terminal
    - Mail (or Outlook)
    - Calendar
    - System Preferences

