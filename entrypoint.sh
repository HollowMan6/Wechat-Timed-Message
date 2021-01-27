#!/usr/bin/env bash

# Setup Environmental Variables
env -0 | while IFS='=' read -r -d '' n v; do
    if [ ${n#INPUT_} != $n ]
    then
        echo "export ${n#INPUT_}='$v'" >> /envar
    fi
done
if [ -f "/envar" ]; then
    source /envar
fi

# Main Program Execution
if [ ! -z $DELAYS ]
then
    # Support delays after a failed pod restart in Kubernetes by creating mark `/cache/runned`
    if [ ! -d "/cache" ] || [ -f "/cache/runned" ]
    then
        echo "---Wait for $DELAYS---"
        sleep $DELAYS
    elif [ -d "/cache" ]
    then
        touch "/cache/runned"
    fi
fi
echo "---Send Message to Wechat---"
python /Wechat-Timed-Message-Through-Actions.py
