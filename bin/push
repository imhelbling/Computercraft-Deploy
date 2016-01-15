#!/usr/bin/env lua

local function printUsage()
print( "Usages:" )
print( "pastebin put <filename>" )
print( "pastebin get <code> <filename>" )
end
local tArgs = { ... }
if #tArgs < 2 then
printUsage()
return
end
local sCommand = tArgs[1]
if sCommand == "put" then
-- Upload a file to pastebin.com
-- Determine file to upload
local sFile = tArgs[2]
local sPath = shell.resolve( sFile )
if not fs.exists( sPath ) or fs.isDir( sPath ) then
print( "No such file" )
return
end
write("Enter paste name: ")
sName = read()

-- Read in the file
if sName == "" then local sName = fs.getName( sPath ) end
local file = fs.open( sPath, "r" )
local sText = file.readAll()
file.close()
-- Log in
print("Log in? y/n")
while true do
login = read()
if login == "y" or login == "n" then break end
end
if login == "y" then
write("Username: ")
username = textutils.urlEncode(read())
write("Password: ")
password = textutils.urlEncode(read("*"))
end
write( "Connecting to pastebin.com... " )
local key = "0ec2eb25b6166c0c27a394ae118ad829"
if login == "y" then
local userraw = http.post(
"http://pastebin.com/api/api_login.php",
"api_dev_key="..key.."&"..
"api_user_name="..username.."&"..
"api_user_password="..password
)
-- get user code in annoying roundabout way
-- error/bug/?: userraw[1]() doesn't work
for i,v in pairs(userraw) do
user = v()
break
end
-- check for errors with pastebin
if string.sub(user, 1, 3) == "Bad" then print("\n"..user) error("") end
local response = http.post(
"http://pastebin.com/api/api_post.php",
"api_option=paste&"..
"api_dev_key="..key.."&"..
"api_user_key="..user.."&"..
"api_paste_format=lua&"..
"api_paste_name="..textutils.urlEncode(sName).."&"..
"api_paste_code="..textutils.urlEncode(sText)
)

print("Done")
print("Check your pastes for find your file")
else
local response = http.post(
"http://pastebin.com/api/api_post.php",
"api_option=paste&"..
"api_dev_key="..key.."&"..
"api_paste_format=lua&"..
"api_paste_name="..textutils.urlEncode(sName).."&"..
"api_paste_code="..textutils.urlEncode(sText)
)
if response then
print( "Success." )

local sResponse = response.readAll()
response.close()

local sCode = string.match( sResponse, "[^/]+$" )
print( "Uploaded as "..sResponse )
print( "Run \"pastebin get "..sCode.."\" to download anywhere" )
else
print( "Failed." )
end
end

elseif sCommand == "get" then
-- Download a file from pastebin.com
if #tArgs < 3 then
printUsage()
return
end
-- Determine file to download
local sCode = tArgs[2]
local sFile = tArgs[3]
local sPath = shell.resolve( sFile )
if fs.exists( sPath ) then
print( "File already exists" )
return
end

-- GET the contents from pastebin
write( "Connecting to pastebin.com... " )
local response = http.get(
"http://pastebin.com/raw.php?i="..textutils.urlEncode( sCode )
)

if response then
print( "Success." )

local sResponse = response.readAll()
response.close()

local file = fs.open( sPath, "w" )
file.write( sResponse )
file.close()

print( "Downloaded as "..sFile )

else
print( "Failed." )
end
else
printUsage()
return
end
