# RemoteRabbit NeoVim setup

Currently using Lazy as my package manager

## Install

### My way

```shell
mkdir -p $HOME/repos/personal
git clone https://github.com/remoterabbit/nvim $HOME/repos/personal
ln -sf $HOME/repos/personal $HOME/.config
```

### Standard

```shell
git clone https://github.com/remoterabbit/nvim $HOME/.config/nvim
```

### No git please

```shell
git clone https://github.com/remoterabbit/nvim $HOME/.config/nvim
rm -rf $HOME/.config/.git
```

After you pull the repo and load neovim make sure to run `:checkhealth` in neovim in order to see that everything is working or if there are packages
you will need to also install (TODO: I will be adding a shell script to do some of this heavy lifting but haven't gotten around to it).

## What is each plugin

| Name | Description |
| ---- | ----------- |

## Notes

### Mason Notes

[https://mason-registry.dev/registry/list](https://mason-registry.dev/registry/list)

### Which-key help

`<CR>` is often seen at the end of some mappings which is used like the `RETURN` or `ENTER` press

```lua
local wk = require("which-key")
wk.register({
  f = {
    name = "file", -- optional group name
    f = { "<cmd>Telescope find_files<cr>", "Find File" }, -- create a binding with label
    r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File", noremap=false, buffer = 123 }, -- additional options for creating the keymap
  },
}, { prefix = "<leader>" })
```
