# dotfiles
My config for dotfiles.
Run `docker build -t alpine-devenv . && docker run -it alpine-devenv` to test it out!

## Setup

Prereqs: `git curl`

- Run `sh -c "$(curl -fsLS git.io/chezmoi)" -- init --apply candrewlee14 && fish`

## Local Changes

To make local changes that won't be overridden on re-applying, make changes in corresponding .local files.

For example, if you want to make local changes to `~/.config/fish/config.fish`, edit `~/.config/fish/config.fish.local`.
