# Overview
This is my personal neovim configuration with good support of lsp, completion engine and snippets. Feel free to use it and cry when it does not work. lolll

# Prerequisites
- nvim 0.8+ (I am using nvim 0.10)
- node for running lsp servers
- go for inline colour code for rgm values
* This list is non-exhaustive

# File structure
**l/p stands for lua/plugin**

- init.vim: Everything starts in here
- keymaps.vim: Things that I do not want to type in the command mode
- options.vim: Some sane options like turning on numbered lines
- lua/master.lua: Where the lazy plugin manager lives and the root of plugins
- l/p/colorscheme.lua: I like trees, and I want my colorscheme to be like trees
- l/p/copilot.lua: Ask copilot to do my work, usually fails horribly
- l/p/edit.lua: Plugins that make my editing journey less painful
- l/p/file.lua: Navigate through filesystems like a chad
- l/p/format.lua: Auto formatters but fasttttt
- l/p/line.lua: A plain but practical statusline
- l/p/lsp.lua: All the magics happen, better than VSCode
- l/p/snip.lua: Do not repeat keystrokes
- l/p/telescope.lua: Pinpoint your search
- l/p/util.lua: I do know how to name this file
- snippets/: snippets

# Credits
Myself, my hard work, my unretreating persistance, my 6 years old macbook and the developers of nvim and its plugins and some youtube tutorial bros.

# Branch
- main: The important one
