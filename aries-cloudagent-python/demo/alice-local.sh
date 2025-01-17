#!/bin/bash
# this runs the Faber example as a local instace of instance of aca-py
# you need to run a local von-network (in the von-network directory run "./manage start <your local ip> --logs")
# ... and you need to install the local aca-py python libraries locally ("pip install -r ../requirements.txt -r ../requirements.indy.txt -r ../requirements.bbs.txt")

# the following will auto-respond on connection and credential requests, but not proof requests
PYTHONPATH=.. ../bin/aca-py start \
   --endpoint https://c9f6d8f144a5.ngrok.app \
   --label alice.agent \
   --inbound-transport http 0.0.0.0 8030 \
   --outbound-transport http \
   --admin 0.0.0.0 8031 \
   --admin-insecure-mode \
   --wallet-type askar \
   --wallet-name alice.agent420695 \
   --wallet-key alice.agent420695 \
   --preserve-exchange-records \
   --auto-provision \
   --seed 12345678912345678912345678912345 \
   --genesis-url http://dev.greenlight.bcovrin.vonx.io/genesis \
   --trace-target log \
   --trace-tag acapy.events \
   --trace-label alice.agent.trace \
   --auto-ping-connection \
   --auto-respond-messages \
   --auto-accept-invites \
   --auto-accept-requests \
   --auto-respond-credential-proposal \
   --auto-respond-credential-offer \
   --auto-respond-credential-request \
   --auto-store-credential

# set these for full auto
#   --auto-respond-presentation-proposal \
#   --auto-respond-presentation-request \
#   --auto-verify-presentation \
