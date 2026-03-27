sudo apt install duf 
sudo apt install btop
sudo apt install git
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
curl -sS https://starship.rs/install.sh | sh
echo eval "$(starship init bash)" >> ~/bashrc
source ~/bashrc
curl -fsS https://dl.brave.com/install.sh | sh
sudo apt install vlc
# Download and install nvm:
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.4/install.sh | bash

# in lieu of restarting the shell
\. "$HOME/.nvm/nvm.sh"

# Download and install Node.js:
nvm install 24

# Verify the Node.js version:
node -v # Should print "v24.14.1".

# Verify npm version:
npm -v # Should print "11.11.0".

