if status is-interactive
    # Commands to run in interactive sessions can go here
    if type -q zoxide
        zoxide init fish | source
    end
    if type -q atuin
        atuin init fish | source
    end
    if type -q direnv
        direnv hook fish | source
    end

    if type -q mise
        mise activate fish | source
    end

    alias ls="lsd"
    set -gx EDITOR nvim

    if test -f ~/.config/fish/config.fish.local
        source ~/.config/fish/config.fish.local
    end
    if test -f ~/.config/fish/config.local.fish
        source ~/.config/fish/config.local.fish
    end
end


