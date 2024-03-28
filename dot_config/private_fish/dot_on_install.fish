# if fisher is not installed, install it
if not functions -q fisher
    curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher
end
if functions -q fisher
    fisher install IlanCosman/tide@v6
    fisher install PatrickF1/fzf.fish
end

fish_add_path ~/.webman/bin/

# if atuin is not installed, install it
if not type -q atuin
    bash (curl https://raw.githubusercontent.com/atuinsh/atuin/main/install.sh | psub)
end
if type -q atuin
    atuin import auto
end
