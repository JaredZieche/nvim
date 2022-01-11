FROM alpine:edge

RUN apk add git nodejs neovim ripgrep alpine-sdk --update

ADD . ~/.config/nvim

RUN nvim -c "autocmd User PackerComplete quitall" -c "PackerSync"
