#!/usr/bin/with-contenv bash
# ==============================================================================
# Community Hass.io Add-ons: Home Panel
# This copies the api files to their respective locations
# ==============================================================================
# shellcheck disable=SC1091
source /usr/lib/hassio-addons/base.sh

echo "REACT_APP_API_URL = $(hass.config.get 'api_url')" > /usr/src/app/.env.local

certfile="/ssl/$(hass.config.get 'certfile')"
keyfile="/ssl/$(hass.config.get 'keyfile')"

if [ -f "$certfile" ]; then
  hass.log.info "Copy SSL certs to api directory"
  cp "$certfile" /usr/src/api/fullchain.pem
  cp "$keyfile" /usr/src/api/privkey.pem
fi