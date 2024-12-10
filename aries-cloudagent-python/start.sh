#!/bin/bash

# set -euxo pipefail

# if [[ -z "$MEDIATOR_URL" ]]; then
#     MEDIATOR_URL=$(curl -s http://ngrok:4040/api/tunnels | jq -r '[.tunnels[] | select(.proto == "https")][0].public_url')
# fi

# echo "Starting agent with endpoint(s): ${MEDIATOR_URL} wss://${MEDIATOR_URL#*://*}"

# acapyCommand=(
#     'aca-py'
#     'start'
#     '--auto-provision'
#     '--arg-file' "/home/cryptic/Cryptic/Playground/aries-cloudagent-python/configs/mediator-auto-accept.yml"
#     '--label' "Mediator"
#     '--inbound-transport' 'http' '0.0.0.0' "3000"
#     '--inbound-transport' 'ws' '0.0.0.0' "3001"
#     '--outbound-transport' 'ws'
#     '--outbound-transport' 'http'
#     '--emit-new-didcomm-prefix'
#     '--wallet-type' 'askar'
#     '--wallet-storage-type' 'postgres_storage'
#     '--admin' '0.0.0.0' "3002"
#     '--admin-api-key' "insecure-hello-world-2"
#     '--endpoint' "http://192.168.0.105" wss://"http://192.168.0.105#*://*}"
#     '--no-ledger'
#     '--open-mediation' 
# )

# if [ "${USE_FIREBASE_PLUGIN}" = "true" ]; then
#     echo "Using Firebase plugin"
#     acapyCommand+=('--plugin' 'firebase_push_notifications')
# else
#     echo "Not using Firebase plugin"
# fi

# poetry run "${acapyCommand[@]}"


# usage: aca-py start [-h] [--admin <host> <port>] [--admin-api-key <api-key>] [--admin-insecure-mode] [--no-receive-invites] [--help-link <help-url>]
#                     [--webhook-url <url#api_key>] [--admin-client-max-request-size ADMIN_CLIENT_MAX_REQUEST_SIZE] [--debug] [--debug-seed <debug-did-seed>]
#                     [--debug-connections] [--debug-credentials] [--debug-presentations] [--debug-webhooks] [--invite] [--connections-invite] [--invite-label <label>]
#                     [--invite-multi-use] [--invite-public] [--invite-metadata-json <metadata-json>] [--test-suite-endpoint <endpoint>] [--auto-accept-invites]
#                     [--auto-accept-requests] [--auto-respond-messages] [--auto-respond-credential-proposal] [--auto-respond-credential-offer]
#                     [--auto-respond-credential-request] [--auto-respond-presentation-proposal] [--auto-respond-presentation-request] [--auto-store-credential]
#                     [--auto-verify-presentation] [--auto-disclose-features] [--disclose-features-list DISCLOSE_FEATURES_LIST] [--arg-file ARG_FILE] [--plugin <module>]
#                     [--block-plugin <module>] [--plugin-config PLUGIN_CONFIG] [-o <KEY=VALUE> [<KEY=VALUE> ...]] [--storage-type <storage-type>]
#                     [-e <endpoint> [<endpoint> ...]] [--profile-endpoint <profile_endpoint>] [--universal-resolver [<universal_resolver_endpoint>]]
#                     [--universal-resolver-regex <did_regex> [<did_regex> ...]] [--universal-resolver-bearer-token [<universal_resolver_token>]]
#                     [--tails-server-base-url <tails-server-base-url>] [--tails-server-upload-url <tails-server-upload-url>] [--notify-revocation]
#                     [--monitor-revocation-notification] [--anoncreds-legacy-revocation {accept,reject}] [--ledger-pool-name <ledger-pool-name>]
#                     [--genesis-transactions <genesis-transactions>] [--genesis-file <genesis-file>] [--genesis-url <genesis-url>] [--no-ledger] [--read-only-ledger]
#                     [--ledger-keepalive LEDGER_KEEPALIVE] [--ledger-socks-proxy <host:port>] [--genesis-transactions-list <genesis-transactions-list>]
#                     [--accept-taa <acceptance-mechanism> <taa-version>] [--log-config <path-to-config>] [--log-file [<log-file>]] [--log-level <log-level>]
#                     [--auto-ping-connection] [--auto-accept-intro-invitation-requests] [--invite-base-url <base-url>] [--monitor-ping] [--monitor-forward]
#                     [--public-invites] [--requests-through-public-did] [--timing] [--timing-log <log-path>] [--trace] [--trace-target <trace-target>]
#                     [--trace-tag <trace-tag>] [--trace-label <trace-label>] [--preserve-exchange-records] [--emit-new-didcomm-prefix] [--emit-new-didcomm-mime-type]
#                     [--exch-use-unencrypted-tags] [--experimental-didcomm-v2] [--auto-provision] [--no-transport] [-it <module> <host> <port>] [-ot <module>]
#                     [-l <label>] [--image-url IMAGE_URL] [--max-message-size <message-size>] [--enable-undelivered-queue] [--max-outbound-retry MAX_OUTBOUND_RETRY]
#                     [--ws-heartbeat-interval <interval>] [--ws-timeout-interval <interval>] [--mediator-invitation <invite URL to mediator>]
#                     [--mediator-connections-invite] [--open-mediation] [--default-mediator-id <mediation id>] [--clear-default-mediator] [--seed <wallet-seed>]
#                     [--wallet-local-did] [--wallet-allow-insecure-seed] [--wallet-key <wallet-key>] [--wallet-rekey <wallet-rekey>] [--wallet-name <wallet-name>]
#                     [--wallet-type <wallet-type>] [--wallet-storage-type <storage-type>] [--wallet-storage-config <storage-config>]
#                     [--wallet-key-derivation-method <key-derivation-method>] [--wallet-rekey-derivation-method <rekey-derivation-method>]
#                     [--wallet-storage-creds <storage-creds>] [--replace-public-did] [--recreate-wallet] [--multitenant] [--jwt-secret <jwt-secret>] [--multitenant-admin]
#                     [--multitenancy-config key=value [key=value ...]] [--base-wallet-routes <REGEX> [<REGEX> ...]] [--endorser-protocol-role <endorser-role>]
#                     [--endorser-invitation <endorser-invitation>] [--endorser-public-did <endorser-public-did>] [--endorser-endorse-with-did <endorser-endorse-with-did>]
#                     [--endorser-alias <endorser-alias>] [--auto-request-endorsement] [--auto-endorse-transactions] [--auto-write-transactions]
#                     [--auto-create-revocation-transactions] [--auto-promote-author-did] [--upgrade-config-path UPGRADE_CONFIG_PATH] [--from-version FROM_VERSION]
#                     [--force-upgrade] [--named-tag NAMED_TAG] [--upgrade-all-subwallets] [--upgrade-subwallet UPGRADE_SUBWALLET] [--upgrade-page-size UPGRADE_PAGE_SIZE]





aca-py start \
--label Mediator \
--inbound-transport http 0.0.0.0 8000 \
--outbound-transport http \
--admin 0.0.0.0 8001 \
--admin-api-key secret1 \
--genesis-url http://dev.greenlight.bcovrin.vonx.io/genesis \
--endpoint http://192.168.0.105:8000/ \
--seed 12345678912345678912345678912345 \
--wallet-type askar \
--wallet-name Mediator \
--wallet-key secret \
--public-invites \
--auto-provision \
--auto-accept-invites \
--auto-accept-requests \
--auto-ping-connection \
--monitor-ping \
--replace-public-did \
--debug-connections \
--open-mediation \



# --endpoint https://e1488e4ae015.ngrok.app \
  #  --label faber.agent \
  #  --inbound-transport http 0.0.0.0 8020 \
  #  --outbound-transport http \
  #  --admin 0.0.0.0 8021 \
  #  --admin-insecure-mode \
  #  --wallet-type askar \
  #  --wallet-name faber.agent916333 \
  #  --wallet-key faber.agent916333 \
  #  --preserve-exchange-records \
  #  --auto-provision \
  #  --seed 12345678912345678912345678912345 \
  #  --genesis-url http://dev.greenlight.bcovrin.vonx.io/genesis \
  #  --trace-target log \
  #  --trace-tag acapy.events \
  #  --trace-label faber.agent.trace \
  #  --auto-ping-connection \
  #  --auto-respond-messages \
  #  --auto-accept-invites \
  #  --auto-accept-requests \
  #  --auto-respond-credential-proposal \
  #  --auto-respond-credential-offer \
  #  --auto-respond-credential-request \
  #  --auto-store-credential