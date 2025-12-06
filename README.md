# Authelia with fully-env-based-config

An Authelia docker image that you can start with 0 config file and thus perfect for serverless deployment.

## Fetures

- Use base64-encoded env var as config.
- Setup initial user via env var.

## Usage

```shell
docker run -d \
  --name authelia \
  -e USERDB_USERNAME=admin \
  -e USERDB_DISPLAY_NAME=Admin \
  -e USERDB_PASSWORD='$argon2id$v=19$m=65536,t=3,p=4$c29tZXNhbHQ$hash...' \
  -e USERDB_EMAIL=admin@example.com \
  -e X_AUTHELIA_CONFIG=/etc/authelia/configuration.yml \
  -e X_AUTHELIA_CONFIG_BASE64={base64} \
  -p 9091:9091 \
  authelia-custom
```
