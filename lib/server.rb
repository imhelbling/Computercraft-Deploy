require 'sinatra'

get '/' do
    <<-HTML
    <h1>What Do?</h1>

    <ul>
        <li>Watch moonscripts and auto-compile luascripts</li>
        <li>Serve a list of all available scripts at /scripts.  This list includes a digest
            of each script so that the ccd client can tell if it needs to download the
            whole script again or not.</li>
        <li>serve a lua script called ccd_client at /client.  This script can retrieve any
            of the other scripts from the server.  For scripts which are already downloaded,
            this client will first check the digest for the script to be downloaded and NOT
            download it if it already has the latest version.</li>
    </ul>
    HTML
end

