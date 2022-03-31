FROM alpine:latest
RUN apk update && apk add git curl
RUN sh -c "$(curl -fsLS git.io/chezmoi)" -- init --apply candrewlee14
# RUN nvim --headless +'PlugInstall --sync' +qa
# RUN nvim --headless -u ~/.config/nvim/coq_init.vim +'PlugInstall --sync' +qa
# RUN nvim --headless -u ~/.config/nvim/cmp_init.vim +'PlugInstall --sync' +qa
ENTRYPOINT ["/bin/zsh"]

