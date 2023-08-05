FROM alpine:3.16

COPY shutdown.sh /sbin/shutdown
COPY entrypoint.sh /entrypoint.sh

RUN apk add --no-cache openssh-client open-vm-tools \
  && ln -sf /sbin/shutdown /sbin/halt \
  && ln -sf /sbin/shutdown /sbin/reboot

ENTRYPOINT [ "/entrypoint.sh" ]
