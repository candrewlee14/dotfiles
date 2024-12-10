if status is-interactive
    # Commands to run in interactive sessions can go here
    functions -q _insert_jj_after_git; and _insert_jj_after_git
    if set -q GHOSTTY_RESOURCES_DIR
        source "$GHOSTTY_RESOURCES_DIR/shell-integration/fish/vendor_conf.d/ghostty-shell-integration.fish"
    end
    if type -q zoxide
        zoxide init fish | source
    end
    if type -q atuin
        atuin init fish | source
    end
    if type -q direnv
        direnv hook fish | source
    end

    if test -f ~/.config/fish/config.fish.local
        source ~/.config/fish/config.fish.local
    end
    if test -f ~/.config/fish/config.local.fish
        source ~/.config/fish/config.local.fish
    end
end

alias ls="lsd"

set -gx EDITOR nvim
