FROM alpine:latest
RUN apk --no-cache add git curl
RUN curl https://raw.githubusercontent.com/candrewlee14/webman/main/scripts/install.sh | sh
RUN sh -c "$(curl -fsLS git.io/chezmoi)" -- init --apply candrewlee14
# RUN nvim --headless +'PlugInstall --sync' +qa
# RUN nvim --headless -u ~/.config/nvim/coq_init.vim +'PlugInstall --sync' +qa
# RUN nvim --headless -u ~/.config/nvim/cmp_init.vim +'PlugInstall --sync' +qa
ENTRYPOINT ["/bin/zsh"]

