#! /bin/bash

# teoforaz - teoforaz@gmail.com - 14/5/2020 - version: 1.0
# License : Distributed under the terms of GNU GPL version 3 or later

CHROMECAST_IP=$1

if [[ $CHROMECAST_IP =~ ^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
  find ./config -type f -print0 | xargs -0 sed -i "s/_YOUR_CHROMECAST_IP_HERE_/"$CHROMECAST_IP"/g"
  mkdir -p ~/.kodi/userdata
  if [ -e ~/.kodi/playercorefactory.xml ];
  then
  	mv ~/.kodi/playercorefactory.xml ~/.kodi/playercorefactory_OLD_BACKUP.xml
  fi
  cp ./config/playercorefactory.xml ~/.kodi/userdata
  sudo cp ./config/kp2chcast /usr/bin
  sudo cp ./menu/*.desktop /usr/share/applications
  echo "Menu for cast in kodi and shorcuts has been installed. See kp2chcast for commands."
else
  echo "Try: ./install.sh 192.168.1.69 (replacing the ip with the local ip of your chromecast)"
fi

exit 0
