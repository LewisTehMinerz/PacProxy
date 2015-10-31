--[[

]]--
local IP = "0.0.0.0"
local ID = os.getComputerID()
function os.getComputerID()
 return IP, ID
end
function setComputerIP( newIP )
 IP = newIP
end
function open( side )
 rednet.open( side )
end
function send( iptosend, message )
 rednet.send( iptosend, { "IPAddress" = IP, "Message" = message }, "PacProxy" )
end
function recieve()
 local _, Msg = rednet.receive( "PacProxy" )
 os.queueEvent( "PacProxy_Message", Msg )
 MsgDecode = textutils.unserialise( Msg )
 IPAddress = MsgDecode[ "IPAddress" ]
 Message = MsgDecode[ "Message" ]
 return IPAddress, Message
end
