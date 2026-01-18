# Neovim theme
Simple neovim high contrast colorscheme inspired on Jetbrain's High Contrast theme.

## Installation

### Lazy

```lua
return {
    "piacsek/high-contrast.nvim",
    lazy = false,
    priority = 1000,
    config = function() 
        vim.cmd.colorscheme("high-contrast")
    end
}
```
