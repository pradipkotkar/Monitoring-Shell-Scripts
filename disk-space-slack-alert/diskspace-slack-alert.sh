#!/bin/bash

### How to use #######################
# mkdir /customscripts
# sh /customscripts/diskspace.sh SERVER_NAME DISKNAME THRESHOLD slack_channel_webhook
# Example:: sh /customscripts/diskspace-slack-alert.sh projectx-jenkins / 80 https://hooks.slack.com/services/XXXXXXXXXX/XXXXXXXXXX/XXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
#-------------------------------------

SERVER_NAME=$1
DISKNAME=$2
THRESHOLD=$3
channel_webhook=$4
CHANNEL=$channel_webhook

#InstanceID=$(curl http://169.254.169.254/latest/meta-data/instance-id 2>/dev/null)
#Fetch InstanceID
EC2_InstanceID_TAG_FILE="/tmp/EC2_InstanceID"

if [ -f "$EC2_InstanceID_TAG_FILE" ]; then
    InstanceID=$(cat "$EC2_InstanceID_TAG_FILE")
fi

if [ -z "$InstanceID" ]; then
    InstanceID=$(curl http://169.254.169.254/latest/meta-data/instance-id 2>/dev/null) && echo "$InstanceID"
    echo "$InstanceID" > "$EC2_InstanceID_TAG_FILE"
fi

PrivateIP=$(hostname -I)

#-------------------------------------

CURRENT=$(df $DISKNAME | grep / | awk '{ print $5}' | sed 's/%//g')

if [ "$CURRENT" -gt "$THRESHOLD" ] ; then

curl -X POST -H 'Content-type: application/json' --data "{\"text\":\" :warning: WARNING: Your server \`$(hostname)\` $SERVER_NAME IP $PrivateIP InstanceID $InstanceID disk $DISKNAME is currently at ${CURRENT}% capacity.\n \`\`\`$(df -h)\`\`\` \"}" $CHANNEL
fi

# END Of Script ----------------------
