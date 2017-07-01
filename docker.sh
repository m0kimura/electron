#!/bin/bash
#
  project=${PWD##*/}
##
  if [[ $1 = "build" ]] ; then
    docker rm -f fx-${project}
    docker build -t ${project} --build-arg user=$USER .

    xhost +local:user
    docker run -it --name fx-${project} \
      -e DISPLAY=$DISPLAY \
      -e XMODIFIERS=$XMODIFIERS \
      -e XIMPROGRAM=$XIMPROGRAM \
      -e GTK_IM_MODULE=$GTK_IM_MODULE \
      -e QT_IM_MODULE=$QT_IM_MODULE \
      -e LC_TYPE=ja_JP.UTF-8 \
      -e TERM=xterm \
      -e SOURCE=$SOURCE \
      -v /tmp/.X11-unix:/tmp/.X11-unix \
      -v /home/$USER \
      -v $HOME/electron:/home/$USER/source \
      ${project}
  elif [[ $1 = "stop" ]]; then
    docker stop fx-${project}
  else
    docker start fx-${project}
  fi
#

