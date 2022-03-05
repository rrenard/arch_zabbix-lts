FROM archlinux

RUN pacman -Sy --noconfirm autoconf make automake pkgconfig gcc fakeroot elfutils binutils \
    && pacman -Sy --noconfirm postgresql-libs libevent go net-snmp unixodbc mariadb-libs \
    && rm -f /var/cache/pacman/pkg/* \
    && echo MAKEFLAGS="-j\$(nproc)" >>/etc/makepkg.conf

ENV GOCACHE=/tmp

COPY entrypoint.sh /

CMD /entrypoint.sh
