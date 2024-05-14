#!/bin/sh
last_commit=$(git rev-parse --short --verify master)
echo
echo "Welcome to:"
echo "                __                                ";
echo "   ____  ____  / /____  ____  ________  __________";
echo "  / __ \/ __ \/ __/ _ \/ __ \/ ___/ _ \/ ___/ ___/";
echo " / / / / /_/ / /_/  __/ /_/ / /  /  __(__  |__  ) ";
echo "/_/ /_/\____/\__/\___/ .___/_/   \___/____/____/  ";
echo "                    /_/  version: master $last_commit";
echo
echo "Notepress author      : https://nosta.me/npub1utx00neqgqln72j22kej3ux7803c2k986henvvha4thuwfkper4s7r50e8"
echo "Docker image author   : https://nosta.me/npub1ky4kxtyg0uxgw8g5p5mmedh8c8s6sqny6zmaaqj44gv4rk0plaus3m4fd2"
echo
echo "Environment variables from compose file:"
echo "- NPUB                : $NPUB"
echo "- HEXKEY              : $HEXKEY"
echo "- RELAYS              : $RELAYS"
echo "- EXCLUDENOTES        : $EXCLUDENOTES"
echo
echo -n ">>> Updating config.js file with variables... "
touch config.js
sed -i '/^export const relays/,/^\];/{d;};' config.js
echo "export const relays = [$RELAYS];" >> config.js
sed -i '/^export const excludeNotes/,/^\];/{d;};' config.js
echo "export const npub = \"$NPUB\";" >> config.js
echo "export const hexkey = \"$HEXKEY\";" >> config.js
echo "export const excludeNotes = [$EXCLUDENOTES];" >> config.js
echo "done ✅"
echo
echo -n ">>> Building notepress... "
echo -n "" 
npx vite build > /dev/null 2>&1
#npx vite build -l silent
echo "done ✅"
echo
echo -n ">>> Copying build files... "
cp -R /app/dist/* /usr/share/nginx/html
echo "done ✅"
echo
echo ">>> Starting notepress..."
echo 
exec "$@"