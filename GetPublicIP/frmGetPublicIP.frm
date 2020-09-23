VERSION 5.00
Object = "{248DD890-BB45-11CF-9ABC-0080C7E7B78D}#1.0#0"; "mswinsck.ocx"
Begin VB.Form frmGetPublicIP 
   BackColor       =   &H00FFFFFF&
   ClientHeight    =   3090
   ClientLeft      =   60
   ClientTop       =   450
   ClientWidth     =   4680
   LinkTopic       =   "Form1"
   ScaleHeight     =   3090
   ScaleWidth      =   4680
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton Command1 
      BackColor       =   &H00FFFFFF&
      Caption         =   "Connect"
      Height          =   255
      Left            =   0
      Style           =   1  'Graphical
      TabIndex        =   0
      Top             =   0
      Width           =   1215
   End
   Begin MSWinsockLib.Winsock WS 
      Left            =   0
      Top             =   240
      _ExtentX        =   741
      _ExtentY        =   741
      _Version        =   393216
   End
End
Attribute VB_Name = "frmGetPublicIP"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'You may freely use this in your programs, please give me credit wherever you can!
'And a link to my website if you will, http://tiamat-studios.net    Thanks and enjoy!
'Created by Jordan Barrett aka SPY-3

Dim HTML As String, PublicIPAddress As String, ArrivalTimes As Integer

Public Sub GetPublicIP()
ArrivalTimes = 0 'We will recieve data twice for the page
HTML = "" 'This will hold the html data returned
WS.Close
DoEvents
WS.Connect "whatismyip.com", 80 'Connect to whatismyip.com
End Sub

Private Sub Command1_Click()
GetPublicIP
End Sub

Private Sub WS_Close()
Dim I As Integer, I1 As Integer
I = InStr(1, HTML, "<h1>Your IP Is", vbTextCompare) + 14 'Find where the ip address begins in the html
I1 = InStr(I, HTML, "</h1>", vbTextCompare) 'Find where the ip address ends in the html header
PublicIPAddress = DecodeIPAddress(Mid(HTML, I, I1 - I)) 'Set this variable to the public ip address
GotPublicIP PublicIPAddress 'Call the sub that tells you when its finished
HTML = "" 'Reset the html so this can be called again later if needed
End Sub

Private Sub WS_Connect()
Dim WebPacket As String
'Simulate a Web Browser Request Packet, I built a basic webserver so I can easily view what
'packets web browsers send to request files, here is a simple one taken from a homepage request.
WebPacket = "GET / HTTP/1.1" & vbCrLf & _
"Host: " & WS.RemoteHost & vbCrLf & _
"Connection: Keep-Alive" & vbCrLf & _
vbCrLf & vbCrLf
'Fairly easy to understand, first the Get /(homepage) HTTP/1.1(html version)
'Host is just the host I connected to, in this case whatismyip.com
'Connection keep alive is as it sounds, tells the server to stay connected to the webbrowser
DoEvents
WS.SendData WebPacket 'Send the packet
End Sub

Private Sub WS_DataArrival(ByVal bytesTotal As Long)
Dim ReturnPacket As String
WS.GetData ReturnPacket 'Get the returned packet which is part 1 of the html
HTML = HTML & ReturnPacket 'add it to the variable
ArrivalTimes = ArrivalTimes + 1 'On the second arrival I have the full html
If ArrivalTimes = 2 Then 'which is what this checks for
ArrivalTimes = 0 'Reset it so it can be used later
WS.Close 'Disconnect since we got what we wanted
WS_Close 'Call the Winsock_Close event so it can parse the ip address
End If
End Sub

Public Function DecodeIPAddress(EncodedIP As String) As String
'After a short time I have figured out what the encoded characters represent
'&#46; = .
'&#48; = 0
'&#49; = 1
'&#50; = 2
'&#51; = 3
'&#52; = 4
'&#53; = 5
'&#54; = 6
'&#55; = 7
'&#56; = 8
'&#57; = 9
'Start
'<h1>Your IP Is
'End
'</h1>
Data = EncodedIP
Data = Replace(Data, "&#46;", ".", , , vbTextCompare)
Data = Replace(Data, "&#48;", "0", , , vbTextCompare)
Data = Replace(Data, "&#49;", "1", , , vbTextCompare)
Data = Replace(Data, "&#50;", "2", , , vbTextCompare)
Data = Replace(Data, "&#51;", "3", , , vbTextCompare)
Data = Replace(Data, "&#52;", "4", , , vbTextCompare)
Data = Replace(Data, "&#53;", "5", , , vbTextCompare)
Data = Replace(Data, "&#54;", "6", , , vbTextCompare)
Data = Replace(Data, "&#55;", "7", , , vbTextCompare)
Data = Replace(Data, "&#56;", "8", , , vbTextCompare)
Data = Replace(Data, "&#57;", "9", , , vbTextCompare)
Data = Replace(Data, "</span>", "", , , vbTextCompare)
Data = Replace(Data, "<span>", "", , , vbTextCompare)
Data = Replace(Data, " ", "", , , vbTextCompare)
'Data = Replace(Data, "", "", , , vbTextCompare)
DecodeIPAddress = Data
End Function

Public Sub GotPublicIP(IP As String)
'You can place anything you want here, if you did a game you would place something to inform
'someone what their internet or public ip address is
MsgBox IP
End Sub

