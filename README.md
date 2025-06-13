# dotfiles
My config for dotfiles.
Clone and run `docker build -t test-devenv . && docker run -it test-devenv` to test them out!

These dotfiles are managed using [chezmoi](https://www.chezmoi.io/).

## Setup

**Prereqs**: `git`, `curl`

If you'd like to use these files long-term, fork this project to manage your own configuration. Then:
 - Change the `email` and `name` in `.chezmoi.toml.tmpl` to your own info.
 - Install with `sh -c "$(curl -fsLS get.chezmoi.io/lb)" -- -b $HOME/.local/bin init --apply <YOUR_USERNAME> && fish`

Personally, I run 
```bash
sh -c "$(curl -fsLS get.chezmoi.io/lb)" -- -b $HOME/.local/bin init --apply candrewlee14 && fish
```

## Information

Here are a few of the primary tools installed here:

- [zoxide](https://github.com/ajeetdsouza/zoxide) - a smarter `cd` replacement
    - use `z` instead of `cd` (not aliased by default)
- [lsd](https://github.com/lsd-rs/lsd) - a modern `ls` replacement
    - this is aliased to `ls` by default
- [fisher](https://github.com/jorgebucaran/fisher) - a plugin manager for `fish`
- [tide](https://github.com/IlanCosman/tide) - a nice `fish` prompt
    - **Post-Install**: run `tide configure` to change the appearance of the prompt
- [atuin](https://github.com/atuinsh/atuin) - helpful shell history
    - by default, it rebinds `ctrl+r` and `up` to use `atuin`
- [mise](https://mise.jdx.dev) - a polyglot tool version manager
- [nvim](https://github.com/neovim/neovim) - a better vim-fork
    - we use [AstroNvim](https://astronvim.com/) to get an IDE-like terminal editor experience
- [zellij](https://github.com/zellij-org/zellij) - a modern `tmux` replacement
    - supports tabs, panes, and detaching/reattaching
- [gh](https://github.com/cli/cli) - GitHub CLI
    - **Post-Install**:  run `gh auth login` to set up git authentication


## Local Changes

To make local changes that won't be overridden on re-applying, make changes in corresponding .local files.

For example, if you want to make local changes to `~/.config/fish/config.fish`, edit `~/.config/fish/config.fish.local` or `~/config/fish/config.local.fish`.


