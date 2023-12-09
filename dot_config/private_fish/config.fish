if status is-interactive
    # Commands to run in interactive sessions can go here
end

fish_add_path $HOME/.webman/bin

set -gx EDITOR nvim

zoxide init fish | source

if test -f ~/.config/fish/config.fish.local
    source ~/.config/fish/config.fish.local
end
