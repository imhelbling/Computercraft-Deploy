file_exists = (file) ->
    fh = io.open file, 'r'
    existence = false
    existence = true if fh
    fh\close!
    existence

download_json = ->
    unless file_exists("json")
        json_url = "http://pastebin.com/raw/4nRg9CHU"
        json_code = http.get json_url
        unless json_code
            print "!! Unable to retrieve contents of #{json_url}"
            os.exit 1
        fh = fs.open "json", 'w'
        fh\write json_code.readAll!
        fh\close!
        json_code.close!

if not http
    print "get requires the http API"
    print "Set enableAPI_http to 1 in mod_ComputerCraft.cfg"

requested = arg[1]

os.loadAPI 'gist_map'

downloaded = {}

for file, url in pairs(gist_map.url_table!)
    if requested == 'all' or file == requested
        print "Retrieving #{file} from #{url}/raw"
        lua_code = http.get "#{url}/raw"
        unless lua_code
            print "!! Unable to retrieve contents of #{file} !!"
            os.exit 1
        fh = fs.open file, "w"
        fh\write lua_code.readAll!
        fh\close!
        lua_code.close!
        table.insert downloaded, file
        print "Remote file \"#{file}\" downloaded successfully!"

print "Successfully downloaded #{#downloaded} files."

