# Neovim configuration

This repository includes my personal `neovim` configuration.
The configuration is focused on simplicity without a lot of
complex plugin settings, but nonetheless provides all the 
tools and functionality that a developer needs in its daily
workflow.

## How to install ?

Before you will be able to use this neovim configuration
some external software has to be installed:

- [neovim](https://github.com/neovim/neovim/tree/v0.8.1)
  (The configuration is currently tested with `v0.8.1`.)
- [packer.nvim](https://github.com/wbthomason/packer.nvim)
  (The neovim package manager of my choice.)
- [lazygit](https://github.com/jesseduffield/lazygit)
  (A simple TUI for git commands.)

Please follow the install instructions that you can find in
the respective repositories.

Now you can clone this repository into `$HOME/.config/`:

```bash
# Navigate to target directory
cd $HOME/.config 

# Clone the repository
git clone git@github.com:client-side96/neovim.git

# Alternatively clone via HTTPS: 
# git clone https://github.com/client-side96/neovim.git
```

To install the plugins listed in `./lua/plugins.lua`
open the configuration directory with `neovim` and
run `:PackerInstall`. Close neovim and reopen the directory.
