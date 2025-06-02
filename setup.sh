pd() { echo "Done.\n"; }

pause() {
    local message="${1:-Press any key to continue...}"
    echo "$message"
    read -n 1 -s
    pd
}

# Homebrew/Command Line Tools
echo "Installing Homebrew and Command Line Tools..."
if command -v brew >/dev/null 2>&1; then
    echo "Homebrew is already installed.\n"
else
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    pd
fi

# Homebrew packages
echo "Installing Homebrew packages..."
brew install gh maccy rectangle
pd

# Folder setup
echo "Creating directories..."
if [[ ! -d "$HOME/code" ]]; then
    echo "Creating ~/code directory."
    mkdir $HOME/code
fi

if [[ ! -d "$HOME/code/personal" ]]; then
    echo "Creating ~/code/personal for personal projects."
    mkdir $HOME/code/personal
fi
pd

# oh-my-zsh
echo "Installing oh-my-zsh..."
if [[ -d "$HOME/.oh-my-zsh" ]]; then
    echo "oh-my-zsh is already installed.\n"
else
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    pd
fi
echo "Installing Powerline fonts..."
if ! ls $HOME/Library/Fonts | grep -q Powerline; then
    echo "Installing powerline fonts..."
    git clone https://github.com/powerline/fonts.git $HOME/fonts
    sh $HOME/fonts/install.sh
    rm -rf $HOME/fonts
    pd
else
    echo "Powerline fonts are already installed.\n"
fi

# BashProfile
echo "Cloning BashProfile..."
export BASH_PROFILE_PATH="$HOME/code/personal/BashProfile"
if [[ -d "$BASH_PROFILE_PATH" ]]; then
    echo "BashProfile is already cloned.\n"
else
    gh repo clone ac3charland/BashProfile $BASH_PROFILE_PATH
    touch $BASH_PROFILE_PATH/local.sh
    pd
fi

echo "Adding BashProfile to .zshrc..."
if grep -q "# User configuration" $HOME/.zshrc; then
    if ! grep -q "BashProfile" $HOME/.zshrc; then
        sed -i '' '/# User configuration/a\
source $HOME/code/personal/BashProfile/profile.sh

' $HOME/.zshrc
        sed -i '' '/# User configuration/a\
export DEFAULT_USER="$(whoami)"

' $HOME/.zshrc
    else
        echo "BashProfile already added to .zshrc\n"
    fi
else
    echo "Pattern '# User configuration' not found in .zshrc\n"
fi

if grep -q "robbyrussell" $HOME/.zshrc; then
    echo "Updating ZSH_THEME to agnoster..."
    sed -i '' 's/robbyrussell/agnoster/' $HOME/.zshrc
    pd
else
    echo "ZSH agnoster theme already applied.\n"
fi

# Node
echo "Installing nvm..."
export NVM_DIR="$HOME/.nvm"
if [[ -d "$NVM_DIR" ]]; then
    echo "nvm is already installed.\n"
else
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
    pd
    echo "Installing LTS version of Node..."
    [ -s "$NVM_DIR/nvm.sh" ] && source "$NVM_DIR/nvm.sh"
    nvm install node
    pd
fi

# Terminal Theme
echo "Add the Agnoster theme to your terminal."
echo "  - Go to Terminal > Settings > Profiles" 
echo "  - Drag Agnoster.terminal from the new Finder window to the list of profiles"
echo "  - Select it and click the 'Default' button at the bottom of the window\n"
open .
pause


echo "Download VS Code:\n(Right click to open)\n"
echo "https://code.visualstudio.com/download"
pause
echo "Set up code command"
echo "  - Open Visual Studio Code"
echo "  - Open the command pallette with Cmd + Shift + P"
echo "  - Search and run 'Shell Command: Install "code" command in PATH'\n"
pause

echo "Installing Extensions..."
code --install-extension k--kato.intellij-idea-keybindings
code --install-extension eamodio.gitlens
code --install-extension orta.vscode-jest
code --install-extension aaron-bond.better-comments
code --install-extension esbenp.prettier-vscode
pd

# TODO copy keybindings.json & settings.json


# Adjust Mac preferences with defaults
echo "Adjusting Mac Preferences..."
sh setup-preferences.sh
pd

echo "Restarting computer to apply changes..."
sleep 5
# sudo shutdown -r now