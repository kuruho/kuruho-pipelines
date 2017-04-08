# See https://github.com/volumio/Build

FROM ubuntu:16.04
RUN apt-get update && \
    apt-get -y dist-upgrade && \
    apt-get -y install \
        git squashfs-tools kpartx multistrap \
        module-init-tools \
        qemu-user-static samba debootstrap \
        parted dosfstools qemu binfmt-support \
        qemu-utils sudo findutils grep login

USER root

# EOF
