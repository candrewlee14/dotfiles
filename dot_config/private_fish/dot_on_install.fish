curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher

fisher install IlanCosman/tide@v6
fisher install PatrickF1/fzf.fish

fish_add_path ~/.webman/bin/

bash (curl https://raw.githubusercontent.com/atuinsh/atuin/main/install.sh | psub)
if type -q $atuin
    atuin import auto
end
