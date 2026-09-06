if test -e /nix/var/nix/profiles/default/etc/profile.d/nix.fish
    source /nix/var/nix/profiles/default/etc/profile.d/nix.fish
end

# Ensure user local bin is in PATH
if test -d ~/.local/bin; and not contains ~/.local/bin $PATH
    fish_add_path -p ~/.local/bin
end

if status is-interactive
    # Commands to run in interactive sessions can go here
    set -g fish_greeting

    # Activate mise first so tools it manages (zoxide, atuin, etc.) are on PATH
    if type -q mise
        mise activate fish | source
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

    # Starship prompt (styled with Omarchy theme)
    if type -q starship
        starship init fish | source
    end

    # Modern directory listing: prefer eza with Omarchy icons, fallback to lsd
    if type -q eza
        alias ls="eza -lh --group-directories-first --icons=auto"
        alias lsa="ls -a"
        alias lt="eza --tree --level=2 --long --icons --git"
        alias lta="lt -a"
    else if type -q lsd
        alias ls="lsd"
    end

    set -gx EDITOR nvim
    set -gx BAT_THEME ansi
    set -gx MANPAGER "sh -c 'col -bx | bat -l man -p'"

    # Omarchy shortcuts (fallback if omarchy-fish package is not yet loaded)
    if type -q omarchy
        if not functions -q a; alias a="omarchy-agent --inline"; end
        if not functions -q c; alias c="opencode --auto"; end
        if not functions -q cx; alias cx='printf "\033[2J\033[3J\033[H" && claude --permission-mode auto'; end
        if not functions -q t; alias t="tmux attach || tmux new -s Work"; end
        if not functions -q mup; alias mup="MISE_MINIMUM_RELEASE_AGE=0 mise up"; end
    end

    if test -f ~/.config/fish/config.fish.local
        source ~/.config/fish/config.fish.local
    end
    if test -f ~/.config/fish/config.local.fish
        source ~/.config/fish/config.local.fish
    end
end


