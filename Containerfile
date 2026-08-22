FROM quay.io/fedora-ostree-desktops/silverblue:44@sha256:ca92f13f07342c30fbc043ad294444f13779585b0f4d27f53ea0cb8f4b637c4b

RUN <<EOF
set -xeuo pipefail

dnf -y --setopt=protected_packages= remove sudo

dnf -y remove \
    firefox \
    gnome-shell-extension-{apps-menu,launch-new-instance,places-menu,window-list} \
    gnome-software-rpm-ostree \
    ptyxis

dnf -y install \
    gnome-console \
    steam-devices

dnf clean all
rm /var/{log,cache,lib}/* -rf

bootc container lint
EOF

LABEL containers.bootc 1
