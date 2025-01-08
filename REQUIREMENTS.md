# Requirements

Tested on Emacs 29.4

## MacOS

Install dependencies using [homebrew](https://brew.sh/) :

```
brew install git aspell ispell python3 ansible gcc \
make automake autoconf libpng zlib poppler \
libvterm node pyenv llvm rust libgccjit cmake 
```

Install Emacs: 

```
brew tap jimeh/emacs-builds
brew install --cask emacs-app-monthly
```

## SUSE Tumbleweed:

```
sudo zypper install git aspell aspell-ispell aspell-spell \
python3 ansible gcc make libpng16-devel libpng16-compat-devel \
zlib-devel libpoppler-devel libpoppler-glib-devel \
glib2-devel pkg-config autoconf automake libvterm-devel \
llvm rust nodejs pyenv
```

## Fedora 41:

```
sudo dnf install git aspell enchant-aspell python3 python3-pip \
make automake ansible gcc llvm libpng-devel zlib-ng-compat-devel \
poppler-glib-devel poppler-devel rust nodejs glib2-devel \
libvterm-devel pkgconf cmake
```
## Manjaro / Arch Linux:

```
sudo pacman -S ispell aspell git python ansible gcc make \
python-pip nodejs rust llvm cmake autoconf automake pyenv \
poppler-glib zlib libvterm
```
