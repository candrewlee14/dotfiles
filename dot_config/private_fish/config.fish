if status is-interactive
    # Commands to run in interactive sessions can go here
    if type -q zoxide
        zoxide init fish | source
    end
    if type -q atuin
        atuin init fish | source
    end

    if test -f ~/.config/fish/config.fish.local
        source ~/.config/fish/config.fish.local
    end
end

fish_add_path $HOME/.webman/bin

set -gx EDITOR nvim

