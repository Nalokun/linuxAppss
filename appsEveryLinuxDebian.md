
# duf 
* alter native df example:
```bash
sudo apt install duf 
duf
```
# btop
* to see a process at computer
example:
```bash
sudo apt install btop
btop --utf-force

```
# ~/.fzf
* help to choice command was already do it in terminal example:
<ol>
<li>open terminal at your linux Debian
<li> press "ctrl+r"
</ol>

```bash
sudo apt install git
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
```
# starship
* make terminal more good look
```bash
curl -sS https://starship.rs/install.sh | sh
echo eval "$(starship init bash)" >> ~/.bashrc
source ~/.bashrc
```
# copyq
curl -s https://api.github.com/repos/hluk/CopyQ/releases/latest \
| grep browser_download_url \
| grep AppImage \
| cut -d '"' -f 4 \
| xargs curl -L -o CopyQ.AppImage
