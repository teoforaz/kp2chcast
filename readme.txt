#####################################################################

# teoforaz - teoforaz@gmail.com - 14/5/2020 - version: 1.0
# License : Distributed under the terms of GNU GPL version 3 or later

#####################################################################

Installation:

chmod +x {install.sh,uninstall.sh,./config/kp2chcast} && ./install.sh

Dependencies you need to install:

https://www.videolan.org
https://mkchromecast.com
https://pypi.org/project/catt
https://pypi.org/project/gnomecast

Also need ffmpeg, mencoder, & restricted-extras codecs installed in your system.

Open port 8010 tcp in your firewall.
If you have problems for cast, this iptables rules can help you:

# chromecast iptables rules
export CHROMECAST_IP=_YOUR_CHROMECAST_IP_HERE_ # Adjust to the Chromecast IP in your local network
iptables -A INPUT -s ${CHROMECAST_IP} -p udp -m multiport --sports 32768:61000 -m multiport --dports 32768:61000 -m comment --comment "Allow Chromecast UDP data (inbound)" -j ACCEPT
iptables -A OUTPUT -d ${CHROMECAST_IP} -p udp -m multiport --sports 32768:61000 -m multiport --dports 32768:61000 -m comment --comment "Allow Chromecast UDP data (outbound)" -j ACCEPT
iptables -A OUTPUT -d ${CHROMECAST_IP} -p tcp -m multiport --dports 8008:8009 -m comment --comment "Allow Chromecast TCP data (outbound)" -j ACCEPT
iptables -A OUTPUT -d 239.255.255.250 -p udp --dport 1900 -m comment --comment "Allow Chromecast SSDP" -j ACCEPT
iptables -A INPUT -p tcp --dport 8010 -s ${CHROMECAST_IP} -j ACCEPT -m comment --comment "LOCAL SERVER FOR CHROMECAST - VLC - CATT - MKCHROMECAST"
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT

About catt:
You can take some control for chromecast with catt in the console. See catt --help for more info.
The rewind and forward functions of catt only work with internet content. I have no idea why. 

Final comment: 
This only integrates into the kodi menu the possibility to open the videos in an external player that has the functionality to send content to chromecast. Some of these players work fine with local content but fail to play intertnet content, and others have problems with local content but play streaming videos well. For this reason several external players have been added. Also note that not all (those that work with internet content) will be able to open any link from any channel without problems. There are many factors. You should test which player works well for each addon and content channel you use. The tests I performed were mostly done with balandro. If something doesn't work, try disabling the firewall and flushing iptables, to make sure this is not what is blocking you from sending content to chromecast.
I'm building something similar for android, but I'm not going to do it for windows. I don't have dualboot and I'm not interested in installing it.


