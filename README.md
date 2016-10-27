# .dotfiles
My personal dot files
## Cloning
### The easy setting
What I use for all computers
```
cd <directory for this>
# Use the link to your fork
git clone https://github.com/BrandonRoehl/dotfiles.git
# The folder just made
cd dotfiles
sh ./init.sh
```
### Custom or trial / browsing
```
git clone --recursive https://github.com/BrandonRoehl/dotfiles.git
```
Or remember to after cloning for the submodules
```
git submodule init
git submodule update --recursive
```
## Making it yours
1. [Fork it](https://github.com/BrandonRoehl/dotfiles/fork)
2. Clone other vim plugins as submodules by using `git submodule add`
3. Commit change and share!
```
cd <dotfile directory>
git submodule add https://github.com/scrooloose/nerdtree.git ./vim/bundle/
```

# Contact
[BrandonRoehl@gmail.com](mailto://brandonroehl@gmail.com)
