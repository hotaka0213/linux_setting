#Neovim
ln init.vim ../.config/nvim/init.vim 
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
	       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'


#bash
ln bashrc ../.bashrc
ln colorrc ../.colorrc
ln xprofile ../.xprofile
#git
ln gitconfig ../.gitconfig
