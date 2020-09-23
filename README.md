<div align="center">

## Get Public Internet IP Address


</div>

### Description

Alright, I know there are lots of these but the ones I found dont work so here is a working one.

This uses only winsock to do all its parsing, it sends a packet request to whatismyip.com and saves the html returned. Then it finds where the ip address is located and parses it out. Now it also decodes the ip address since whatismyip seems to have encoded the ip address for what ever reason.

When its done (usually in less then a second) it calls GotPublicIP(IP as string)

inside that sub you can make it do whatever you wanted the internet or public ip address for.

To use simply call GetPublicIP() and place code for what to do with the public IP in GotPublicIP(IP as string)

under this function the variable IP is the public ip address, you can also use the PublicIPAddress variable both contain the same thing.

Hope this helps and enjoy!!

You may use this code in your projects but please give me credit where you can and it would be great if you would link to my website as well. http://tiamat-studios.net
 
### More Info
 


<span>             |<span>
---                |---
**Submitted On**   |2007-09-24 20:54:10
**By**             |[SPY\-3](https://github.com/Planet-Source-Code/PSCIndex/blob/master/ByAuthor/spy-3.md)
**Level**          |Intermediate
**User Rating**    |4.2 (25 globes from 6 users)
**Compatibility**  |VB 5\.0, VB 6\.0
**Category**       |[Coding Standards](https://github.com/Planet-Source-Code/PSCIndex/blob/master/ByCategory/coding-standards__1-43.md)
**World**          |[Visual Basic](https://github.com/Planet-Source-Code/PSCIndex/blob/master/ByWorld/visual-basic.md)
**Archive File**   |[Get\_Public2084589242007\.zip](https://github.com/Planet-Source-Code/spy-3-get-public-internet-ip-address__1-69369/archive/master.zip)








