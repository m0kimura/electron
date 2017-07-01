FROM m0kimura/ubuntu-base

RUN apt-get update \

include(`vscode.m4')

&&  apt-get clean \
&&  rm -rf /var/lib/apt/lists/*

include(`user.m4')

COPY vscode.sh /root/vscode.sh
CMD /root/vscode.sh
