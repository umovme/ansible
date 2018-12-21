FROM alpine:3.8

RUN apk add --no-cache python2 py-boto gcc py2-pip python2-dev openssl-dev make musl-dev libffi-dev \
  && cd /tmp \
  && wget https://releases.ansible.com/ansible/ansible-2.7.5.tar.gz  \ 
  && tar xvzf ansible-2.7.5.tar.gz \
  && cd /tmp/ansible-2.7.5 \
  && python setup.py install \
  && cd /tmp \
  && rm -rfv /tmp/ansible-2.7.* \
  && apk del gcc python2-dev openssl-dev make musl-dev libffi-dev

ENTRYPOINT [ "ansible-playbook" ]

