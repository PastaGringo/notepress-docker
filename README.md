# notepress-docker

Simple notepress docker image & docker-compose to self-host your own nostr blog!

_SSL not yet supported but you can use Nginx Proxy Manager or Traefik to serve HTTPS_

From notepress (utxo-one) : https://github.com/utxo-one/notepress

# How to use

Docker-compose.yml file:
```
version: '3.8'
services:

  notepress:
    container_name: notepress
    image: pastagringo/notepress-docker
    environment:
      - NPUB=npub1ky4kxtyg0uxgw8g5p5mmedh8c8s6sqny6zmaaqj44gv4rk0plaus3m4fd2
      - HEXKEY=b12b632c887f0c871d140d37bcb6e7c1e1a80264d0b7de8255aa1951d9e1ff79
      - RELAYS="wss://relay.utxo.one","wss://relay.bitcoinpark.com","wss://relay.damus.io","wss://nos.lol"
      - EXCLUDENOTES="ffa61fb02c3dda819f98a887df1c1ce9aa4c2b73d8035b4a03fa6bc94d484455","cc45a58d8c5f35ba15e38c9dd1bc03175e33e3dd13fa1247a7f1e217ed9ef409"
    ports:
      - 80:80
    restart: unless-stopped
```
Starting container with docker compose:
```
docker compose up -d && docker logs -f notepress

Welcome to:
                __                                
   ____  ____  / /____  ____  ________  __________
  / __ \/ __ \/ __/ _ \/ __ \/ ___/ _ \/ ___/ ___/
 / / / / /_/ / /_/  __/ /_/ / /  /  __(__  |__  ) 
/_/ /_/\____/\__/\___/ .___/_/   \___/____/____/  
                    /_/  version: master 1a3e01a

Notepress author: https://nosta.me/npub1utx00neqgqln72j22kej3ux7803c2k986henvvha4thuwfkper4s7r50e8
Docker image author: https://nosta.me/npub1ky4kxtyg0uxgw8g5p5mmedh8c8s6sqny6zmaaqj44gv4rk0plaus3m4fd2

Environment variables from compose file:
npub: npub1ky4kxtyg0uxgw8g5p5mmedh8c8s6sqny6zmaaqj44gv4rk0plaus3m4fd2
hexkey: b12b632c887f0c871d140d37bcb6e7c1e1a80264d0b7de8255aa1951d9e1ff79
relays: "wss://relay.utxo.one","wss://relay.bitcoinpark.com","wss://relay.damus.io","wss://nos.lol"
excludeNotes: "ffa61fb02c3dda819f98a887df1c1ce9aa4c2b73d8035b4a03fa6bc94d484455","cc45a58d8c5f35ba15e38c9dd1bc03175e33e3dd13fa1247a7f1e217ed9ef409"

Updating config.js file with variables...
Done ✅

Building notepress silently...
Done ✅

Copying build files...
Done ✅

Starting notepress...

2024/03/23 22:30:14 [notice] 1#1: using the "epoll" event method
2024/03/23 22:30:14 [notice] 1#1: nginx/1.25.4
2024/03/23 22:30:14 [notice] 1#1: built by gcc 12.2.1 20220924 (Alpine 12.2.1_git20220924-r10) 
2024/03/23 22:30:14 [notice] 1#1: OS: Linux 5.15.0-100-generic
2024/03/23 22:30:14 [notice] 1#1: getrlimit(RLIMIT_NOFILE): 1048576:1048576
2024/03/23 22:30:14 [notice] 1#1: start worker processes
2024/03/23 22:30:14 [notice] 1#1: start worker process 43
2024/03/23 22:30:14 [notice] 1#1: start worker process 44
2024/03/23 22:30:14 [notice] 1#1: start worker process 45
2024/03/23 22:30:14 [notice] 1#1: start worker process 4
```
Access to notepress at:
```
http://yourip:80
```
