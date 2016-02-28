--[[
 @name        PacProxy
 @author      LewisTehMinerz
 @description PacProxy is a ComputerCraft proxy API to use IP's instead of ID's.
 @isAPI       Yes
 @requires    Nothing
]]--
local IP = "0.0.0.0"
local ID = os.getComputerID()
function os.getComputerID()
 return IP, ID
end
function os.getComputerIP()
 return IP
end
function setComputerIP( newIP )
 IP = newIP
end
function open( side )
 rednet.open( side )
end
function send( iptosend, message )
 rednet.send( iptosend, { ["IPAddress"] = IP, ["Message"] = message }, "PacProxy" )
end
function recieve()
 local _, Msg = rednet.receive( "PacProxy" )
 os.queueEvent( "pacproxy_message_raw", Msg )
 MsgDecode = textutils.unserialise( Msg )
 IPAddress = MsgDecode[ "IPAddress" ]
 Message = MsgDecode[ "Message" ]
 os.queueEvent( "pacproxy_message", IPAddress, Message )
 return IPAddress, Message
end
