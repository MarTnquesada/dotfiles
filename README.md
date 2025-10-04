# martin_setup
My personal dev setup. A lot of choices are due to me needing to work similarly on macOS and Linux. 

## Fast install

Use the `install-mint.sh` or `install-macos.sh` scripts in this repository. 

## Terminal setup

**Terminal emulator**

I am currently using Ghostty because it gives me the least problems in macOS.

**Terminal multiplexer**

I use tmux, but only to run and dettach stuff when needed. No custom configuration. 

**Shell prompt**

I use Starship. After installing it, add a line at the end of `~/.bashrc` or `~/.zshrc` as follows:
```bash
eval "$(starship init zsh)"
```

Finally, add my current configuration by copying the starship.toml file from this repository into `~/.config/starship.toml`.


**Editor setup**

I am using nvim v0.11.3 at the moment, with LazyVim as plugin manager. My current configuration can be found within `configs/nvim`. 


## Shortcut Cheat Sheet

**tmux**

|  Key   | Action |
| -------- | ------- |
|tmux ls| List all sessions|
|tmux kill-server| Gracefully kill all sessions and server|
|tmux kill <session>| Kill tmux session|
|tmux a -t my_session| Attach to a given session|
|Ctrl-b d| Dettach from current session|
|Ctrl-b D| Dettach from current session and attach to other|
|Ctrl-b s| Get an interactive list of all sessions| 
|Ctrl-b $| Rename current session|  


**Vim**

Movement
|  Key   | Action |
| -------- | ------- |
| `h`,`j`, `k`, `l` | Left, down, up, right |
| `w` | Go to the start of the next word |
| `e` | Go to the end of the next word |
| `b` | Go to previous word |
| `_` | Go to the start of the line |
| `0` | Go to position 0 of the line |
| `$` | Go to the end of the line |
| `%` | Move cursor to matching bracket |
| `f` + symbol | Go to symbol in line. `;` forwards, `,` backwards |
| `t` + symbol | Go to after symbol in line. `;` forwards, `,` backwards |
| `{\|}` | Go to previous/next paragraph |
| `<C-d>` | Jump half page down |
| `<C-u>` | Jump half page up |
| `zz` | Move cursor to the center of the screen |
| `G` | Jump to the bottom of the file |
| `gg` | Jump to the start of the file |
| `:<number>`| Jump to specific line |
| `/` | Search. `ENTER` to starch searching, `n` to go to next result, `N` to previous result |
| `*` | Starts search for word in current cursor position |

Command (command + number + movement)
|  Key   | Action |
| -------- | ------- |
| `i` | Insert left | 
| `I` | Insert at the beginning of the line | 
| `a` | Insert right |
| `A` | Insert at the end of the line |
| `o` | Insert new line below |
| `O` | Insert new line above |
| `d` | Delete |
| `y` | Yank |  
| `[d\|y\|v]iw` | Delete/yank/select current word |
| `p` | Paste | 
| `x` | Remove current character |
| `r` | Replace curent character | 
| `cc` | Delete line and enter insert mode | 
| `c$` | Delete to the end of the line and enter insert mode | 
| `cw` | Delete to the end of the word and enter insert mode | 
| `ciw` | Delete entire word and enter insert mode | 
| `.` | Repeat last command | 
| `[v\|y\|d]i[}\|]]` | Select/yank/delete everything inside the current brackets |
| `[v\|y\|d]a[}\|]]` | Select/yank/delete everything inside the current brackets, including them |
| `<C-w>w` | Jump into floating window |
| `>` | Tab selection forward |
| `gv` | To re-select previously selected area |

**Neovim Plugins**

LSP (Language Server Protocol)
| Key | Action |
| --- | ------ |
| `gd` | Go to definition |
| `gD` | Go to declaration |
| `gi` | Go to implementation |
| `gr` | Show references |
| `K` | Show hover information |
| `<C-k>` | Show signature help |
| `<leader>rn` | Rename symbol |
| `<leader>ca` | Code actions |
| `<leader>d` | Open diagnostic float |
| `[d` | Go to previous diagnostic |
| `]d` | Go to next diagnostic |
| `<leader>lf` Format file |

nvim-tree (File Explorer)
| Key | Action |
| --- | ------ |
| `<leader>e` | Toggle file tree |
| `<leader>o` | Focus/open file tree |
| `<leader>f` | Find current file in tree |
| `Enter` or `o` | Open file/folder |
| `a` | Create new file/folder |
| `d` | Delete file/folder |
| `r` | Rename file/folder |
| `x` | Cut to clipboard |
| `c` | Copy to clipboard |
| `p` | Paste from clipboard |
| `R` | Refresh tree |
| `q` | Close nvim-tree |

Telescope (Fuzzy Finder)
| Key | Action |
| --- | ------ |
| `<leader>ff` | Find files |
| `<leader>fg` | Live grep (search in files) |
| `<leader>fb` | Find buffers |
| `<leader>fh` | Find help tags |
| `<C-n>` / `<C-p>` | Next/previous result |
| `<C-c>` | Close telescope |
| `<CR>` | Select item |

Blink (completion)
| Key | Action |
| --- | ------ |
| `<C-space>` | Show/hide documentation |
| `<C-y>|<Tab>` | Accept current item  |
| `<C-n>` | Select next |
| `<C-p>` | Select previous |
| `<C-b>` | Scroll documentation up |
| `<C-f>` | Scroll documentation down |
| `<Tab>` | Snippet forward |
| `<C-k>` | Show signature |

