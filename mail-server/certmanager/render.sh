#!/bin/bash
export $(cat .env | xargs)
envsubst < clusterissuer-godaddy.yaml.template > clusterissuer-godaddy.yaml
echo "✅ clusterissuer-godaddy.yaml updated"