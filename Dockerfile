FROM alpine:edge
RUN apk --no-cache add git curl
RUN sh -c "$(curl -fsLS git.io/chezmoi)" -- init --apply candrewlee14
ENV SHELL /usr/bin/fish
CMD ["fish"]
