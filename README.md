# fzf-git

Use [fzf](https://github.com/junegunn/fzf) to complete git stuff using `^G`

## Installation

You need to have [fzf](https://github.com/junegunn/fzf) installed. Then:

### Antigen

`antigen bundle fvictorio/fzf-git`

### Manually

Clone this repository and add source it from your `zshrc`.

## Features

- Pressing `^G` after `git checkout` will search through your branches, in order of recent usage
- Pressing `^G` in any other context will complete your modified or staged files
