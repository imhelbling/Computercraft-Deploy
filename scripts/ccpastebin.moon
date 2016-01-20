printUsage = ->
	print "Usages:"
    print "pastebin put <filename>"
    print "pastebin get <code> <filename>"
    print "pastebin run <code> <arguments>"

tArgs = {...}
if #tArgs < 2
	printUsage!
	return

if not http
	printError "Pastebin requires http API"
    printError "Set http_enable to true in ComputerCraft.cfg" 
    return

get = paste ->
	write "Connecting to pastebin.com... " 
    response = http.get(
        "http://pastebin.com/raw/"..textutils.urlEncode( paste )
    )    

    if response
        print "Success!"
        
        sResponse = response.readAll!
        response.close!
        return sResponse
    else
        printError "Failed."

sCommand = tArgs[1]
if sCommand == "put"
    -- Upload a file to pastebin.com
    -- Determine file to upload
    sFile = tArgs[2]
    sPath = shell.resolve( sFile )
    if not fs.exists( sPath ) or fs.isDir( sPath )
        print "No such file"
        return

    -- Read in the file
    sName = fs.getName( sPath )
    file = fs.open( sPath, "r" )
    sText = file.readAll!
    file.close!

--    -- POST the contents to pastebin
--    write( "Connecting to pastebin.com... " )
--    key = "0ec2eb25b6166c0c27a394ae118ad829"
--    response = http.post(
--        "http://pastebin.com/api/api_post.php", 
--        "api_option=paste&"..
--        "api_dev_key="..key.."&"..
--        "api_paste_format=lua&"..
--        "api_paste_name="..textutils.urlEncode(sName).."&"..
--        "api_paste_code="..textutils.urlEncode(sText)
--    )

    if response
        print( "Success." )
        
        sResponse = response.readAll()
        response.close()
                
        sCode = string.match( sResponse, "[^/]+$" )
        print( "Uploaded as "..sResponse )
        print( "Run \"pastebin get "..sCode.."\" to download anywhere" )

    else
    	print "Failed."

elseif sCommand == "get"
    -- Download a file from pastebin.com
    if #tArgs < 3
        printUsage()
        return

    -- Determine file to download
    sCode = tArgs[2]
    sFile = tArgs[3]
    sPath = shell.resolve( sFile )
    if fs.exists( sPath )
        print "File already exists" 
        return

    -- GET the contents from pastebin
    res = get(sCode)
    if res       
        file = fs.open( sPath, "w" )
        file.write( res )
        file.close!

        print "Downloaded as "..sFile

elseif sCommand == "run"
    sCode = tArgs[2]

    res = get(sCode)
    if res
        func, err = load(res, sCode, "t", _ENV)
        if not func
            printError( err )
            return

        success, msg = pcall(func, table.unpack(tArgs, 3))
        if not success then
            printError( msg )
else
    printUsage!
    return