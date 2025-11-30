#!/bin/sh

if [ -n "$USERDB_USERNAME" ] && [ -n "$USERDB_DISPLAY_NAME" ] && [ -n "$USERDB_PASSWORD" ] && [ -n "$USERDB_EMAIL" ]; then
    mkdir -p /etc/authelia
    
    cat > /etc/authelia/users.yaml << EOF
users:
  ${USERDB_USERNAME}:
    displayname: "${USERDB_DISPLAY_NAME}"
    password: "${USERDB_PASSWORD}"
    email: "${USERDB_EMAIL}"
    groups:
      - admins
      - dev
EOF
    
    echo "Written user db file: /etc/authelia/users.yaml"
fi

# Handle base64 encoded configuration
if [ -n "$X_AUTHELIA_CONFIG_BASE64" ]; then
    # Determine target config file path
    CONFIG_PATH="${X_AUTHELIA_CONFIG:-/config/configuration.yml}"
    
    CONFIG_DIR=$(dirname "$CONFIG_PATH")
    mkdir -p "$CONFIG_DIR"
    
    echo "$X_AUTHELIA_CONFIG_BASE64" | base64 -d > "$CONFIG_PATH"
    
    echo "Decoded configuration written to: $CONFIG_PATH"
fi

exec /app/entrypoint.sh "$@"
