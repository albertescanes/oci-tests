FROM quay.io/fedora-ostree-desktops/silverblue:rawhide@sha256:8ffc09536aa80f0abac8319b044ac1e2da22199c1276d759fdee092b13ca07c6

RUN <<EOF
set -xeuo pipefail

dnf -y --setopt=protected_packages= remove sudo

dnf -y remove \
    firefox \
    gnome-shell-extension-{apps-menu,launch-new-instance,places-menu,window-list} \
    gnome-software-rpm-ostree
    ptyxis

dnf -y install \
    gnome-console
    steam-devices

dnf clean all
rm /var/{log,cache,lib}/* -rf

bootc container lint
EOF

LABEL containers.bootc 1
