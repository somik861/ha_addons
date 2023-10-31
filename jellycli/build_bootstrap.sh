#! /bin/sh

SERVER_URL="http://192.168.0.102:8096"
USERNAME="JellySpeaker"
PASSWORD=""

# inject server URL
sed -i "s/__JELLYCLI_SERVER_URL/${SERVER_URL}/" './api/jellyfin/api.go'


# inject cretendtials
sed -i "s/__JELLYCLI_USERNAME/${USERNAME}/" './api/jellyfin/api.go'
sed -i "s/__JELLYCLI_PASSWORD/${PASSWORD}/" './api/jellyfin/api.go'

