#!/bin/sh -e

# adapted from contrib/runits/prerenderer.runit from esplora

set -e

export STATIC_ROOT=${STATIC_ROOT:-unset-static-root}
export BASE_HREF=${BASE_HREF:-unset-base-href}
export NODE_ENV=${NODE_ENV:-production}
export API_URL=${API_URL:-unset-api-url}
export TZ=UTC
export PORT=${PORT:-5001}

# TODO remove this, here for debugging
export NODE_ENV=--inspect=0.0.0.0:9229

exec /bin/bash -c 'NODE_OPTIONS=--inspect=0.0.0.0:9229 source /root/.nvm/nvm.sh && cd /srv/explorer/source && npm run prerender-server -- --cluster ${FLAVOR}' 2>&1
