#! /bin/sh

unset JELLYCLI_PLAYER_NOGUI
unset JELLYCLI_JELLYFIN_URL
unset JELLYCLI_JELLYFIN_USERID
unset JELLYCLI_JELLYFIN_PASSWORD
unset JELLYCLI_JELLYFIN_MUSIC_VIEW

echo "JELLYCLI_PLAYER_NONGUI" "${JELLYCLI_PLAYER_NOGUI}"
echo "JELLYCLI_JELLYFIN_URL" "${JELLYCLI_JELLYFIN_URL}"
echo "JELLYCLI_JELLYFIN_USERID" "${JELLYCLI_JELLYFIN_USERID}"
echo "JELLYCLI_JELLYFIN_PASSWORD" "${JELLYCLI_JELLYFIN_PASSWORD}"
echo "JELLYCLI_JELLYFIN_MUSIC_VIEW" "${JELLYCLI_JELLYFIN_MUSIC_VIEW}"

echo "Program started"

/usr/local/bin/jellycli

echo "Program ended ???"
