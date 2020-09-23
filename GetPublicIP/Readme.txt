Alright, I know there are lots of these but the ones I found dont work so here is a working one.
This uses only winsock to do all its parsing, it sends a packet request to whatismyip.com and saves the html returned. Then it finds where the ip address is located and parses it out. Now it also decodes the ip address since whatismyip seems to have encoded the ip address for what ever reason.
When its done (usually in less then a second) it calls GotPublicIP(IP as string)
inside that sub you can make it do whatever you wanted the internet or public ip address for.
To use simply call GetPublicIP() and place code for what to do with the public IP in GotPublicIP(IP as string)
under this function the variable IP is the public ip address, you can also use the PublicIPAddress variable both contain the same thing.
Hope this helps and enjoy!!
You may use this code in your projects but please give me credit where you can and it would be great if you would link to my website as well. http://tiamat-studios.net

Created by Jordan Barrett aka SPY-3
Website: http://tiamat-studios.net