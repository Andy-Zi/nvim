# nvim

## install latest nvim

```bash
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt update

sudo apt-get install build-essential gdb

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
nvm install --lts
nvm use --lts
```

## plugins

### plugin setup

#### Copilot

:Copilot setup

### Telescope

requires [ripgrep](https://github.com/BurntSushi/ripgrep)

```bash
curl -LO https://github.com/BurntSushi/ripgrep/releases/download/13.0.0/ripgrep_13.0.0_amd64.deb
sudo dpkg -i ripgrep_13.0.0_amd64.deb
```
