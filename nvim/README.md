# RemoteRabbit NeoVim setup

Currently using Lazy as my package manager

## What is each plugin

<table>
    <tr>
        <th align="center">
            <img width="220" height="1">
            <p>
                <small>Plugin</small>
            </p>
        </th>
        <th align="center">
            <img width="442" height="1">
            <p>
                <small>What does it do?</small>
            </p>
        </th>
        <th align="center">
            <img width="220" height="1">
            <p>
                <small>Link to config</small>
            </p>
        </th>
    </tr>
    <tr>
        <td>First</td>
        <td>Second</td>
        <td>third</td>
    </tr>
</table>

## Which-key help

`<CR>` is often seen at the end of some mappings which is used like the `RETURN` or `ENTER` press

```lua
local wk = require("which-key")
-- As an example, we will create the following mappings:
--  * <leader>ff find files
--  * <leader>fr show recent files
--  * <leader>fb Foobar
-- we'll document:
--  * <leader>fn new file
--  * <leader>fe edit file
-- and hide <leader>1

wk.register({
  f = {
    name = "file", -- optional group name
    f = { "<cmd>Telescope find_files<cr>", "Find File" }, -- create a binding with label
    r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File", noremap=false, buffer = 123 }, -- additional options for creating the keymap
    n = { "New File" }, -- just a label. don't create any mapping
    e = "Edit File", -- same as above
    ["1"] = "which_key_ignore",  -- special label to hide it in the popup
    b = { function() print("bar") end, "Foobar" } -- you can also pass functions!
  },
}, { prefix = "<leader>" })
```
