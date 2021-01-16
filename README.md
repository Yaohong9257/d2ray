# v2ray-letsencrypt-docker
Clean, dockerized v2ray(Websocket + TLS) + Nginx + Let's Encrypt with official and well-maintained docker containers. No BS private containers.

## Supports:
- v2ray with websocket + TLS protocol using the [official v2ray docker image](https://hub.docker.com/r/v2ray/official/).
- Nginx frontend and **auto-renewing** Let's Encrypt certificate using the popular [linuxserver/swag](https://hub.docker.com/r/linuxserver/swag/).
- This project basically generates UUID, random paths and uses python to process the templates.
## Usage:
### Required packages
- docker-ce.
- docker-compose.
- python-jinja2. A popular python template processor. Just search for jinja2 with your distro's package manager.

### Building
- Clone this repo with your user instead of root.
- Make sure you run setup.py with your user instead of root otherwise Nginx will not start. 
- Run `python setup.py -h` for directions.
- For example, if your full domain name is `aaa.bb.c` and your email is `d@e.f` then run `python setup.py -d bb.c -s aaa -e d@e.f`
- To start over, run `git reset --hard`. Don't run this with a running build or you will lose your existing config!

### Connecting
After spinning up all the containers, you can use client.conf to connect. If you are setting it up on your phone, connect to subdomain.domain.tld:443 and use websocket obfuscation.

### Troubleshooting
- Make sure your subdomain.domain.tld points to the server.
- Use `docker logs nginx` to check for nginx init errors. Detailed nginx logs and be found in `nginx/logs/nginx`
- Use `docker logs v2ray` to check for v2ray init errors.
