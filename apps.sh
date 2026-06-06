sudo apt install duf 
sudo apt install btop
sudo apt install git
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
curl -sS https://starship.rs/install.sh | sh
echo eval "$(starship init bash)" >> ~/.bashrc
source ~/bashrc
curl -fsS https://dl.brave.com/install.sh | sh
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
# vscode
echo "code code/add-microsoft-repo boolean true" | sudo debconf-set-selections
sudo apt install wget gpg &&
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | sudo gpg --dearmor -o /usr/share/keyrings/microsoft.gpg
sudo tee /etc/apt/sources.list.d/vscode.sources > /dev/null << 'EOF'
Types: deb
URIs: https://packages.microsoft.com/repos/code
Suites: stable
Components: main
Architectures: amd64,arm64,armhf
Signed-By: /usr/share/keyrings/microsoft.gpg
EOF
sudo apt update
sudo apt install code
# brave origin
curl -fsS https://dl.brave.com/install.sh | FLAVOR=origin CHANNEL=nightly sh
# telegram desktop
cd ~/Downloads
curl -L https://telegram.org/dl/desktop/linux -o ~/Downloads/telegram.tar.xz
mkdir telegramDir;
cd telegramDir
tar -xf ~/Downloads/telegram.tar.xz
# copyq
curl -s https://api.github.com/repos/hluk/CopyQ/releases/latest
| grep browser_download_url
| grep AppImage
| cut -d '"' -f 4
| xargs curl -L -o CopyQ.AppImage

