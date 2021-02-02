#!/usr/bin/env bash

# Setup Secrets
echo "---Enter your Actions Secrets, empty if it doesn't exists---"
command="kubectl create secret generic wechat-timed-message-secrets"

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
    command=$command" --from-file=title=tmpt"
else
    command=$command" --from-literal=title="
fi
echo "-msg(Empty line to end):"
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
    command=$command" --from-file=msg=tmpm"
else
    command=$command" --from-literal=msg="
fi

secrets=("serverchansckey" "openid" "pptoken" "pptopic")
for secret in ${secrets[*]}
do
    read -p "-"$secret": " content
    command=$command" --from-literal="$secret"="$content
done
$command

if [ -f "tmpt" ]; then
    rm tmpt
fi
if [ -f "tmpm" ]; then
    rm tmpm
fi

# Create cronJob
kubectl create -f Wechat-Timed-Message.yml

# Check Details
kubectl get secret/wechat-timed-message-secrets configmap/wechat-timed-message-configmap cronjob/wechat-timed-message
