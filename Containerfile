FROM quay.io/fedora/fedora-silverblue:rawhide@sha256:1c0d2007afbec0822af4a1191cedf4866f389ca42b0e83655d61058a91460bb0

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
