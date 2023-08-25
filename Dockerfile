FROM alpine:3.10

ARG SAMBA_USER='user'
ARG SAMBA_PASS='password'
ARG SAMBA_VERSION='4.11'

RUN apk add --no-cache --update \
    "samba-common-tools<${SAMBA_VERSION}" \
    "samba-client<${SAMBA_VERSION}" \
    "samba-server<${SAMBA_VERSION}"

RUN adduser -D -u 1000 ${SAMBA_USER} && \
echo -ne ""${SAMBA_PASS}"\n"${SAMBA_PASS}"\n" | smbpasswd -a -s ${SAMBA_USER}

COPY smb.conf /etc/samba/smb.conf

EXPOSE 445/tcp
EXPOSE 445/udp

CMD ["smbd", "--foreground", "--log-stdout", "--no-process-group"]
