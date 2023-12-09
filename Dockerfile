FROM alpine:latest
RUN apk --no-cache add git curl
RUN sh -c "$(curl -fsLS git.io/chezmoi)" -- init --apply candrewlee14
ENTRYPOINT ["/bin/fish"]

