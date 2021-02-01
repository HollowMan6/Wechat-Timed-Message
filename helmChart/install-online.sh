#!/usr/bin/env bash

kubectl create ns wechat-timed-message
# Add Repo
helm repo add Wechat-Timed-Message http://hollowman.ml/Wechat-Timed-Message

# Install
echo "---Enter your Actions Secrets, empty if it doesn't exists---"
command="helm install wechat-timed-message Wechat-Timed-Message/wechat-timed-message --namespace wechat-timed-message"

echo "-title(Empty line to end):"
while read content
do
    if [ -z "$content" ]
    then
        break
    else
        echo "$content" >> tmpt
    fi
done
if [ -f "tmpt" ]; then
    command=$command" --set-file title=tmpt"
else
    command=$command" --set title="
fi
echo "-message(Empty line to end):"
while read content
do
    if [ -z "$content" ]
    then
        break
    else
        echo "$content" >> tmpm
    fi
done
if [ -f "tmpm" ]; then
    command=$command" --set-file message=tmpm"
else
    command=$command" --set message="
fi

secrets=("serverChanSCKey" "openID" "ppToken" "ppTopic")
for secret in ${secrets[*]}
do
    read -p "-"$secret": " content
    command=$command" --set "$secret"='"$content"'"
done
$command

if [ -f "tmpt" ]; then
    rm tmpt
fi
if [ -f "tmpm" ]; then
    rm tmpm
fi
