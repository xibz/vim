echo "Copying vimrc"
sudo cp vimrc ~/.vimrc
echo "Copying tmux"
sudo cp .tmux.conf ~/
echo "Copying git config"
sudo cp .gitconfig ~/
echo "Installing tmux"
sudo apt-get install tmux
echo "Installing ctags"
sudo apt-get install ctags
echo "Copying nerd tree"
sudo cp -r ./nerdTree/* ~/.vim
echo "Copying ctrlp"
sudo cp -r ./ctrlp/* ~/.vim
echo "Copying ftdetect"
sudo cp -rf ./ftdetect/ ~/.vim
echo "Copying syntax"
sudo cp -rf ./syntax/ ~/.vim
mkdir bundle
cd ./bundle
echo "Cloning Vundle"
git clone https://github.com/gmarik/Vundle.vim.git
echo "Cloning easy motion"
git clone https://github.com/Lokaltog/vim-easymotion.git
echo "Cloning vim go"
git clone https://github.com/fatih/vim-go.git
cd ..
sudo cp -rf ./bundle/ ~/.vim
