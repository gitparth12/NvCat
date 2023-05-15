# init.lua
_Based on [this config](https://github.com/ThePrimeagen/init.lua) by [ThePrimeagen](https://github.com/ThePrimeagen) with my own changes_

Requirements:
* neovim=0.8.3
* ripgrep
* packer.nvim
    - Go [here](https://github.com/wbthomason/packer.nvim) for installation instructions

There are two ways of using this config after cloning this repo.

_One_ ⭢ replacing current config
1. Manually delete everything in ~/.config/nvim (rm -rf ~/.config/nvim && mkdir ~/.config/nvim)
2. Move contents of the cloned repository to ~/.config/nvim (mv ./* ~/.config/nvim)
3. Go to ./lua/gitparth12/ and open packer.lua using nvim (you might see errors but ignore them for now and just enter the file)
4. Run ':so' and then ':PackerSync'

_Two_ ⭢ creating symbolic link
1. Run 'dev' in the repo, this will delete ~/.config/nvim and create a symbolic link of the current directory to the config path
3. Go to ./lua/gitparth12/ and open packer.lua using nvim (you might see errors but ignore them for now)
4. Run ':so' and then ':PackerSync'
