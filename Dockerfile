FROM m0kimura/ubuntu-base

COPY init.sh /root/init.sh
RUN apt-get update && \
    apt-get install -y libgtk2.0-0 libgconf2-4 \
      libnss3 libasound2 libxtst6 libcanberra-gtk-module libgl1-mesa-glx libnotify4 libxkbfile1 libxss1 && \
    cd /root && \
    wget https://packages.microsoft.com/repos/vscode/pool/main/c/code/code_1.12.2-1494422229_amd64.deb && \
    dpkg -i code_1.12.2-1494422229_amd64.deb && \
    rm code_1.12.2-1494422229_amd64.deb && \
    npm install -g electron && \
    npm install -g electron-packager && \
    usermod -aG video ${user} && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

VOLUME /home/${user}
vOLUME /home/${user}/source
WORKDIR /home/${user}
USER ${user}
ENV HOME=/home/${user} USER=${user}

CMD /root/init.sh

