# Dotfiles

These are my dotfiles. Like pretty much all dotfiles, they are largely stolen
from other, smarter people. Let me know if you find them useful or if you have
any suggestions for how they could be improved!

## Setup

First start by cloning this repo into your home directory.

```shell
cd ~
git clone https://github.com/dpcleitao/Dotfiles.git
```

Then copy or symlink the dotfiles you want to use.

```shell
# Method 1: Copying
# Recommended if you want to add your own config.
cp ~/Dotfiles/zshrc ~/.zshrc
cp ~/Dotfiles/vimrc ~/.vimrc
cp ~/Dotfiles/gitconfig ~/.gitconfig
cp ~/Dotfiles/gitignore_global ~/.gitignore_global
cp ~/Dotfiles/irbrc ~/.irbrc
cp ~/Dotfiles/gemrc ~/.gemrc
cp ~/Dotfiles/pryrc ~/.pryrc

# Method 2: Symlinking
# Recommended if you want to be able to `git pull` updates easily.
ln -s ~/Dotfiles/zshrc ~/.zshrc
ln -s ~/Dotfiles/vimrc ~/.vimrc
ln -s ~/Dotfiles/gitignore_global ~/.gitignore_global
ln -s ~/Dotfiles/irbrc ~/.irbrc
ln -s ~/Dotfiles/gemrc ~/.gemrc
ln -s ~/Dotfiles/pryrc ~/.pryrc
ln -s ~/Dotfiles/hammerspoon ~/.hammerspoon
ln -s ~/Dotfiles/karabiner/karabiner.json ~/.config/karabiner


#Personally, I symlink everything other than my `.gitconfig` because you need to
fill in your own email and name for that file. If you want to symlink that as well you can with the following command.
ln -s ~/Dotfiles/gitconfig ~/.gitconfig
```



### Installing Dependencies

Note: If this is a fresh install you will need to install Homebrew first.

My dotfiles have a few dependencies. Most of these can be installed with
[homebrew](https://brew.sh/).

To install these dependencies with homebrew `cd` into the Dotfiles directory and
type `brew bundle`. You can comment out any dependencies you don't want in the
Brewfile.

Some of my dotfiles have Ruby gem dependencies. To install these first make sure
you are using a non-system Ruby version (run `rbenv version` if you're using
rbenv). And then run `bundle install` inside this directory.

Below I've included some instructions for setup specific to individual dotfiles.

### zshrc

I use [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh). You'll need to
install oh-my-zsh for my zshrc config to work. To download it see the
instructions on the oh-my-zsh github page.

### vimrc

To install the vim packages first install
[vim-plug](https://github.com/junegunn/vim-plug).

Then inside vim run `:PlugInstall`.

After installing the vim plugins, you'll also need to do some manual
configuration to compile the C code that comes with the
[ctrlp-cmatcher](https://github.com/JazzCore/ctrlp-cmatcher) plugin. You can
find details for this on the github page for this plugin
[here](https://github.com/JazzCore/ctrlp-cmatcher#installation).

#### Linting

For code linting, I use [ALE](https://github.com/w0rp/ale). ALE acts as a
universal interface to underlying linting libraries. However, ALE does not
pre-install these linting libraries and will only make use of them when they are
already available. This means that in order to make full use of ALE you need to
install some additional libraries. You can see the exact breakdown of their
supported linting libraries broken down by language
[here](https://github.com/w0rp/ale#supported-languages).

For example, in order to install the full set of Ruby linting packages that ALE
supports do the following:

```shell
gem install brakeman rails_best_practices reek rubocop ruby solargraph
```

However, you may not want all of a language's linting packages as many have
overlapping functionality and some may not be relevant to the framework you are
using so I recommend reading up on the package before installing it.

### pryrc/irbrc

My pryrc and irbrc use a gem called `awesome_print`. You can install by running
`gem install awesome_print` or by running `bundle install` inside this
directory.

### gitconfig

You'll need to replace `<YOUR NAME>` and `<YOUR EMAIL>` with your name and
email.

### Iterm Profile

I have my iTerm2 profile exported as the `com.googlecode.iterm2.plist` XML file.
This file represents all the configuration for my iTerm profile. If you would
like to apply this configuration to your iTerm setup, use the instructions in
[this
article](http://stratus3d.com/blog/2015/02/28/sync-iterm2-profile-with-dotfiles-repository/)
to source your profile's settings from this file.
