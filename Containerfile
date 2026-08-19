FROM quay.io/fedora-ostree-desktops/silverblue:rawhide@sha256:cc5839fa9dae1edff55f8f1762890b19e834b76580cb225c5ecb4076c2345777

RUN <<EOF
set -xeuo pipefail

dnf -y install steam-devices

dnf -y --setopt=protected_packages= remove sudo

dnf -y remove \
    firefox \
    gnome-shell-extension-{apps-menu,launch-new-instance,places-menu,window-list} \
    gnome-software-rpm-ostree

dnf clean all
rm /var/{log,cache,lib}/* -rf

bootc container lint
EOF

LABEL containers.bootc 1
