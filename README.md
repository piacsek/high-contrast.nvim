# Neovim theme
Simple neovim high contrast colorscheme inspired on Jetbrain's High Contrast theme. I've fine-tuned this specifically for my Elixir day to day at work.

<img width="1226" height="402" alt="CleanShot 2026-01-17 at 18 32 59@2x" src="https://github.com/user-attachments/assets/3c7dd03e-540b-4897-8fa2-a70d36018949" />
<img width="1394" height="284" alt="CleanShot 2026-01-17 at 18 33 16@2x" src="https://github.com/user-attachments/assets/229cb684-f37d-4922-ac3b-f1e4a23d570e" />
<img width="1236" height="408" alt="CleanShot 2026-01-17 at 18 33 38@2x" src="https://github.com/user-attachments/assets/897f608a-f05e-4382-90bf-ede308e6ff53" />


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
