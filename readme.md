# WIP
---
# NeoVim installation

*This installation assumes a basic understanding of vim and its text editing commands and motions.*

I came to find that the installation process from other sources wasn’t suitable and had some bumps along the way. Perhaps this tutorial can help walk you through so that you don’t have to spend as much time with pathing issues and such as I found myself struggling with.

Installing Neovim isn’t much out of the ordinary. You can go and find the latest release for the Mac installation of Neovim here and scroll down to find the nvim-macos.tar.gz. From there you can extract the files which will create a folder named nvim-macos. This should likely be moved to your home directory (or ~) so that you can set paths for it and know it will likely stay there for the foreseeable future.

## Set alias in your terminal zsh or bash profile
In my case I chose to set an alias in my zsh_profile so that I could easily run the nvim command along with whatever file in whatever directory I am in.

Since I installed neovim in my home directory, adding the following in my `.zshrc` allows me to call `nvim` from anywhere in my command line to open up the neovim editor

`alias nvim=‘~/nvim-macos/bin/nvim’`

Feel free to setup a command yourself, and replace `nvim` after alias with whatever phrase you prefer.

*Note: from here on you will see me using the command ‘nvim’ along with files as that is the way it is aliased in my system.*

## Configuration
Now test it out! Try running Neovim for the first time! Maybe take a look at a configuration file, or perhaps create a text file and test out opening it up! 

`nvim _filename_here_`

At this point, if you are coming from vim rather than from a text editor and using vim techniques you could look up a guide for translating your init.vim file into your matching init.lua file. I’ll let you go there and do that, then come back if you want to follow along with the rest! If you’d rather do a fresh install or don’t come from vim prior, then continue to follow along below.

### Setting up your configuration files
You need to setup the following in order to get started:
- `mkdir ~/.config/nvim`
- `touch ~/.config/nvim/init.lua`
- `mkdir ~/.config/nvim/lua`
- Setup leader keys
- Create vars, options, keys, plugins

### Installing Packer - Plugins
##WARNING: YMMV

When setting up Packer for plug-in management I attempted to follow this tutorial: https://mattermost.com/blog/turning-neovim-into-a-full-fledged-code-editor-with-lua/. I was unable to get things to work the way they did, so I did it the following way and got things to work, finally.

`git clone --depth 1 https://github.com/wbthomason/packer.nvim\ ~/.local/share/nvim/site/pack/packer/start/packer.nvim`

`[[ plug.lua ]]


local vim = vim

local execute = vim.api.nvim_command
local fn = vim.fn

-- ensure that packer is installed
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
  execute 'packadd packer.nvim'
end
vim.cmd('packadd packer.nvim')
local packer = require'packer'
local util = require'packer.util'
packer.init({
package_root = util.join_paths(vim.fn.stdpath('data'), 'site', 'pack')
})

--- startup and add configure plugins
packer.startup(function()
  local use = use

  -- [[ PLUGINS ]]
  -- fill in later
end)`

Once you have this setup, you should be able to add a plugin in the packer.startup function with the syntax of

'use { 'repository_creator/repository' }
