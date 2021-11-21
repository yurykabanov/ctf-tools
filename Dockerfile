FROM ubuntu:21.10

ADD scripts/install.sh /

ADD configs/.config /root/.config
ADD configs/.gdbinit /root
ADD configs/.tmux.conf /root

RUN bash -c "/install.sh" && rm "/install.sh"

VOLUME ["/opt/data"]

ENTRYPOINT ["/usr/bin/fish"]
