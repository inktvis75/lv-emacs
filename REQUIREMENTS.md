# Requirements

Tested on Emacs 29.4

## MacOS

Install dependencies using [homebrew](https://brew.sh/) :

```
brew install git aspell ispell python3 ansible gcc \
make automake autoconf libpng zlib poppler \
libvterm node pyenv llvm rust libgccjit cmake \
basedpyright pyright yaml-language-server \
ansible-language-server enchant python-lsp-server \
bash-language-server font-jetbrains-mono \
font-jetbrains-mono-nerd-font

sudo mkdir /usr/local/include

sudo ln -s /opt/homebrew/Cellar/enchant/2.8.2/include/enchant-2 \
/usr/local/include/enchant-2 
```

## SUSE Tumbleweed:

```
sudo zypper install git aspell aspell-ispell aspell-spell \
python3 ansible gcc make libpng16-devel libpng16-compat-devel \
zlib-devel libpoppler-devel libpoppler-glib-devel \
glib2-devel pkg-config autoconf automake libvterm-devel \
llvm rust nodejs pyenv enchant
```

## Fedora 41:

```
sudo dnf install git aspell enchant-aspell python3 python3-pip \
make automake ansible gcc llvm libpng-devel zlib-ng-compat-devel \
poppler-glib-devel poppler-devel rust nodejs glib2-devel \
libvterm-devel pkgconf cmake enchant
```

## Manjaro / Arch Linux:

```
sudo pacman -S ispell aspell git python ansible gcc make \
python-pip nodejs rust llvm cmake autoconf automake pyenv \
poppler-glib zlib libvterm enchant noto-fonts texlive \
noto-fonts-emoji noto-fonts-extra ttf-liberation \
ttf-dejavu ttf-roboto ttf-jetbrains-mono ttf-fira-code \
ttf-hack adobe-source-code-pro-fonts hunspell hunspell-en_us
```

## Python dependencies:

```
pip3 install epc orjson sexpdata six setuptools paramiko \
rapidfuzz watchdog packaging ruff-lsp pyright yamllint \
pyenchant
```
