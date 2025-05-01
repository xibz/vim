#!/bin/zsh
ROOT=`pwd`
BLUE='\e[1;34m'
CYAN='\e[1;36m'
RED='\e[1;31m'
GREEN='\e[1;32m'
NC='\e[0m'


os_type=`uname -s`
if [[ $os_type == "Darwin" ]]; then
	echo -e "${RED}Uninstalling msgpack-python${NC}"
	pip3 uninstall msgpack-python
	echo -e "${GREEN}Installing msgpack${NC}"
	pip3 install -U msgpack
	brew install node mono cmake macvim shortcat
	# jump to definition for java
	brew install --HEAD universal-ctags/universal-ctags/universal-ctags
	brew install ripgrep
	brew install zoxide
else
	echo -e "${GREEN}Updating package cache${NC}"
	sudo apt-get update
	echo -e "${GREEN}Updating dependencies${NC}"
	sudo apt-get install build-essential cmake vim-nox python3-dev mono-complete nodejs default-jdk npm ripgrep zsh
	echo -e "${GREEN}installing pip for autocomplete plugin${NC}"
	sudo apt-get install -y python3-pip
	echo -e "${RED}Uninstalling msgpack-python${NC}"
	pip3 uninstall msgpack-python
	echo -e "${GREEN}Installing msgpack${NC}"
	pip3 install -U msgpack
	curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh
fi
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
	    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo -e "${GREEN}Installing vim-plug${NC}"
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
	    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Oh My Zsh
echo -e "${GREEN}Installing oh my zsh${NC}"
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
echo -e "${GREEN}Copying zshrc${NC}"
cp zshrc ~/.zshrc
echo -e "${GREEN}Installing k${NC}"
git clone https://github.com/supercrabtree/k $ZSH_CUSTOM/plugins/k

# Starship stuffery
echo -e "${GREEN}Installing Starship${NC}"
sh -c "$(curl -fsSL https://starship.rs/install.sh)"
mkdir -p ~/.config
cp ./starship.toml ~/.config/
cp ./starship-git-user.sh /usr/local/bin/
cp ./starship-git.sh /usr/local/bin/

pip3 install --user pynvim

echo -e "${GREEN}Copying vimrc${NC}"
sudo cp vimrc ~/.vimrc
echo -e "${GREEN}Copying inputrc${NC}"
sudo cp inputrc ~/.inputrc
echo -e "${GREEN}Copying xinitrc${NC}"
sudo cp xinitrc ~/.xinitrc
echo -e "${GREEN}Copying Xmodmap${NC}"
sudo cp Xmodmap ~/.Xmodmap
echo -e "${GREEN}Copying tmux.conf${NC}"
sudo cp .tmux.conf ~/
echo -e "${GREEN}Copying Xresources${NC}"
sudo cp Xresources ~/.Xresources
echo -e "${CYAN}Merging Xresources${NC}"
xrdb -merge ~/.Xresources
echo -e "${GREEN}Copying git config${NC}"
sudo cp .gitconfig ~/
echo -e "${GREEN}Installing tmux${NC}"
sudo apt-get install tmux
echo -e "${GREEN}Installing ctags${NC}"
sudo apt-get install ctags
echo -e "${GREEN}Installing vim-plug${NC}"
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
echo -e "${GREEN}Installing lombok.jar${NC}"
mkdir $HOME/lombok
sudo wget https://projectlombok.org/downloads/lombok.jar -P $HOME/lombok/
sudo chmod +x $HOME/lombok.jar

################################
# Plugins
################################
echo -e "${GREEN}Copying pathogen${NC}"
git clone https://github.com/tpope/vim-pathogen.git pathogen
sudo cp -r ./pathogen/* ~/.vim

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

echo -e "${GREEN}installing tmux conf${NC}"
git clone https://github.com/gpakosz/.tmux.git
ln -s -f .tmux/.tmux.conf ~/.tmux.conf
cp .tmux/.tmux.conf.local ~/.tmux.conf.local

echo -e "${GREEN}Setting git diff and merge tool"
git config --global diff.tool vimdiff
git config --global merge.tool vimdiff

################################
# Syntax
################################
echo -e "${GREEN}Copying ftdetect${NC}"
sudo cp -rf ./ftdetect ~/.vim
echo -e "${GREEN}Copying ftplugin${NC}"
sudo cp -rf ./ftplugin ~/.vim
echo -e "${GREEN}Copying syntax${NC}"
sudo cp -rf ./syntax ~/.vim

################################
# Bundles
################################
# delete the current bundle folder in
# the vim directory
if [ -d ~/.vim/bundle ]; then
sudo rm -rf ~/.vim/bundle
fi

mkdir -p bundle
cd bundle
echo -e "${GREEN}Installing Vundle${NC}"
git clone https://github.com/VundleVim/Vundle.vim.git
echo -e "${GREEN}Installing easy motion${NC}"
git clone https://github.com/Lokaltog/vim-easymotion.git
echo -e "${GREEN}Installing vim go${NC}"
git clone https://github.com/fatih/vim-go.git
echo -e "${GREEN}Installing syntastic${NC}"
git clone --depth=1 https://github.com/vim-syntastic/syntastic.git
echo -e "${GREEN}Installing git-gutter${NC}"
git clone git://github.com/airblade/vim-gitgutter.git

echo -e "${GREEN}Symlinking bundle folder${NC}"
sudo ln -s `pwd` ~/.vim/bundle

echo -e "${GREEN}Exporting variables to .bash_profile${NC}"
echo "export PATH=$PATH:/$HOME/go/bin" >> $HOME/.bash_profile
mkdir -p $HOME/go
mkdir -p $HOME/go/bin
go get -u github.com/golang/lint/golint

# opening vim
echo -e "${GREEN}Run PluginInstall and GoInstallBinaries${NC}"
echo -e "${GREEN}press enter to start vim${NC}"
read -r b
vim test.go

# install YouCompleteMe
echo -e "${GREEN}Compiling YouCompleteMe Server${NC}"
cd ~/.vim/plugged/YouCompleteMe
python3 install.py --all
cd $ROOT

has_vi_mode=`cat $HOME/.inputrc | grep vi-command`

if [[ -z $has_vi_mode ]]; then
	echo -e "${GREEN}Update inputrc with vim keybindings${NC}"
	echo "set editing-mode vi" >> $HOME/.inputrc
	echo "set keymap vi-command" >> $HOME/.inputrc
fi

echo -e "${GREEN}Initializing zoxide${NC}"
zoxide init --cmd cd zsh

echo -e "${RED}Finished${NC}"
