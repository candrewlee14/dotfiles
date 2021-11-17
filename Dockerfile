FROM alpine:latest
RUN apk update && apk add git curl
RUN sh -c "$(curl -fsLS git.io/chezmoi)" -- init --apply candrewlee14
ENTRYPOINT ["/bin/zsh"]

