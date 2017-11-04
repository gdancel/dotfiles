# neovim
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
mkdir -p ~/.config/nvim
cp .nvimrc ~/.config/nvim/init.vim

# chunkwm  + khd
cp .khdrc ~/.khdrc
cp .chunkwmrc ~/.chunkwmrc
