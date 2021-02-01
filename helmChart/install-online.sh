#!/usr/bin/env bash

# Add Repo
helm repo add Wechat-Timed-Message http://hollowman.ml/Wechat-Timed-Message

# Install
echo "---Enter your Actions Secrets, empty if it doesn't exists---"
secrets=("title" "message" "serverChanSCKey" "openID" "ppToken" "ppTopic")
command="helm install Wechat-Timed-Message/wechat-timed-message wechat-timed-message"
for secret in ${secrets[*]}
do
    read -p "-"$secret": " content
    command=$command" --set "$secret"='"$content"'"
done
$command
