# Computercraft-Deploy

Provides an easy and fast way to deploy scripts to computercraft...repeatedly.

1) Watches for code changes
2) Automatically compiles moonscript to lua
3) serves lua scripts via a local web server

Ccdeploy's webserver will also serve a ccdeploy client via the server which can be downloaded and run from
a ComputerCraft turtle or console.  This client will

1) enable the downloading of any deployed script (e.g. `deploy ferryman`)
2) update all downloaded scripts to the latest version (e.g. `deploy`)
3) download **all the scripts** (e.g. `deploy all`)
