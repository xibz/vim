BLUE='\e[1;34m'
CYAN='\e[1;36m'
RED='\e[1;31m'
GREEN='\e[1;32m'
NC='\e[0m'

echo -e "${GREEN}Copying vimrc${NC}"
sudo cp vimrc ~/.vimrc
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

################################
# Plugins
################################
echo -e "${GREEN}Copying nerd tree${NC}"
git clone git@github.com:scrooloose/nerdtree.git nerdTree
sudo cp -r ./nerdTree/* ~/.vim

echo -e "${GREEN}Copying ctrlp${NC}"
git clone git@github.com:kien/ctrlp.vim.git ctrlp
sudo cp -r ./ctrlp/* ~/.vim

echo -e "${GREEN}Copying pathogen${NC}"
git clone git@github.com:tpope/vim-pathogen.git pathogen
sudo cp -r ./pathogen/* ~/.vim

echo -e "${GREEN}Copying tagbar${NC}"
git clone git@github.com:majutsushi/tagbar.git tagbar
sudo cp -r ./tagbar/* ~/.vim

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
rm -rf ~/.vim/bundle
fi

mkdir bundle
cd bundle
echo -e "${GREEN}Installing Vundle${NC}"
git clone https://github.com/VundleVim/Vundle.vim.git
echo -e "${GREEN}Installing easy motion${NC}"
git clone https://github.com/Lokaltog/vim-easymotion.git
echo -e "${GREEN}Installing vim go${NC}"
git clone https://github.com/fatih/vim-go.git

echo -e "${GREEN}Symlinking bundle folder${NC}"
ln -s ~/vim/bundle ~/.vim/bundle

echo -e "${GREEN}Exporting variables to .bash_profile${NC}"
echo "export PATH=$PATH:/$HOME/Go/bin" >> $HOME/.bash_profile 
mkdir $HOME/Go
mkdir $HOME/Go/bin
cd $HOME/Go
export GOPATH=$HOME/Go
go get -u github.com/golang/lint/golint

echo -e "${RED}Finished${NC}"
