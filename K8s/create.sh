#!/usr/bin/env bash

# Setup Secrets
echo "---Enter your Actions Secrets, empty if it doesn't exists---"
secrets=("title" "msg" "serverchansckey" "openid" "pptoken" "pptopic")
command="kubectl create secret generic wechat-message-secret"
for secret in ${secrets[*]}
do
    read -p "-"$secret": " content
    command=$command" --from-literal="$secret"='"$content"'"
done
$command

# Create cronJob
kubectl create -f Wechat-Timed-Message-Through-Actions.yml

# Check Details
kubectl get secret/wechat-message-secret configmap/wechat-message-delays cronjob/wechat-timed-message-through-actions
