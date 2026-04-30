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
sudo apt update
sudo apt install code
# brave origin
curl -fsS https://dl.brave.com/install.sh | FLAVOR=origin CHANNEL=nightly sh
# install docker 
sudo apt-get update
sudo apt-get install ca-certificates curl gnupg
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
# test docker
sudo docker run hello-world

# telegram desktop
cd ~/Downloads
curl -L https://telegram.org/dl/desktop/linux -o ~/Downloads/telegram.tar.xz
mkdir telegramDir;
cd telegramDir
tar -xf ~/Downloads/telegram.tar.xz

