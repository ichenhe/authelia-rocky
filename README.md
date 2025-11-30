# Authelia with userdb

Implement env-var-based user configuration based on the official Authlia image.

## Fetures

Configure userdb with env var.

## Usage

```bash
docker run -d \
  --name authelia \
  -e USERDB_USERNAME=admin \
  -e USERDB_DISPLAY_NAME=Admin \
  -e USERDB_PASSWORD='$argon2id$v=19$m=65536,t=3,p=4$c29tZXNhbHQ$hash...' \
  -e USERDB_EMAIL=admin@example.com \
  -v /path/to/config:/config \
  -p 9091:9091 \
  authelia-custom
```
