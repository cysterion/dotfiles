# .dotfiles
My personal dot files
## Cloning
### The easy setting
What I use for all computers
```bash
cd ~/wherever
# Use the link to your fork
git clone https://github.com/BrandonRoehl/dotfiles.git
# The folder just made
cd dotfiles
./init
```
### Custom or trial / browsing
```bash
git clone --recursive https://github.com/BrandonRoehl/dotfiles.git
```
Or remember to after cloning for the submodules
```bash
git submodule init
git submodule update --recursive
```
## Making it yours
1. [Fork it](https://github.com/BrandonRoehl/dotfiles/fork)
2. Clone other vim plugins as submodules by using `git submodule add`
3. Commit change and share!
```bash
cd $DOTDIR # Works if installed
git submodule add https://github.com/scrooloose/nerdtree.git ./vim/bundle/
```

# Contact
[BrandonRoehl@gmail.com](mailto://brandonroehl@gmail.com)
