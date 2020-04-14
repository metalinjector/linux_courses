FROM archlinux/base 

RUN pacman -Syu --noconfirm grep make \
        ttf-inconsolata adobe-source-sans-pro-fonts \
        texlive-core \
        texlive-langcyrillic \
        texlive-latexextra \
        texlive-bin \
        texlive-pictures ttf-dejavu
WORKDIR /slides
ENTRYPOINT ["./build/build.sh"]
