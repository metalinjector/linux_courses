FROM finalduty/archlinux:daily

RUN pacman -Syu --noconfirm  make \
        texlive-core \
        texlive-langcyrillic \
        texlive-latexextra \
        texlive-bin \
        texlive-pictures ttf-dejavu ;\
    pacman -Scc --noconfirm
