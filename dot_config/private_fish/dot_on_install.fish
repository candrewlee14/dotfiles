# if fisher is not installed, install it
if not functions -q fisher
    curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher
    if not functions -q fisher
        echo "fisher failed to install"
    else
        fisher install IlanCosman/tide@v6
        fisher install PatrickF1/fzf.fish
    end
end

fish_add_path ~/.webman/bin/
set -gx --path XDG_DATA_DIRS $XDG_DATA_DIRS:$HOME/.local/share/

# if atuin is not installed, install it
if not type -q atuin
    bash (curl https://raw.githubusercontent.com/atuinsh/atuin/main/install.sh | psub)
    if not type -q atuin
        echo "atuin failed to install"
    else
        atuin import auto
    end
end


