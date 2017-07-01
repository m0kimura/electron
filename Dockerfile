FROM m0kimura/ubuntu-base

RUN apt-get update \


## VSCODE
&&  apt-get install -y libgtk2.0-0 libgconf2-4 \
      libnss3 libasound2 libxtst6 libcanberra-gtk-module libgl1-mesa-glx libnotify4 libxkbfile1 libxss1 \
&&  cd /root \
&&  wget https://packages.microsoft.com/repos/vscode/pool/main/c/code/code_1.12.2-1494422229_amd64.deb \
&&  dpkg -i code_1.12.2-1494422229_amd64.deb \
&&  rm code_1.12.2-1494422229_amd64.deb \
##

&&  apt-get clean \
&&  rm -rf /var/lib/apt/lists/*


##  USER
ENV HOME=/home/${user} USER=${user}
WORKDIR $HOME
USER $USER
##

COPY vscode.sh /root/vscode.sh
CMD /root/vscode.sh
