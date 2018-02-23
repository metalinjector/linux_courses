FROM finalduty/archlinux:daily

RUN pacman -Syu --noconfirm  make \
        ttf-inconsolata adobe-source-sans-pro-fonts \
        texlive-core \
        texlive-langcyrillic \
        texlive-latexextra \
        texlive-bin \
        texlive-pictures ttf-dejavu; \
    pacman -Scc --noconfirm
