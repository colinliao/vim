# vim

##First of all
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

##Secondly
set $PATH、$GOBIN、$GOCACHE、$GOPATH、$GOROOT in the right directory.

##Finally
If you're block by the wall
cd $GOPATH/src && git clone --depth 1 https://github.com/golang/tools.git golang.org/x/tools
then in the vim
:BinaryInstall

If you want play with go
cd ~/.vim/bundle/YouCompleteMe/ && ./install.py --clang-compeleter --go-completer

##Congratulations

