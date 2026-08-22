FROM quay.io/fedora/fedora-silverblue:rawhide@sha256:cdbc24401522cf38f02f4d6f382f862039360be0cb17bcaa4b3da82763721cfb

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
