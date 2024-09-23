#!/bin/bash
# Script to get alerts on Slack for memory usage

### Usage ############################
# ./memory-slack-alert.sh SERVER_NAME THRESHOLD SLACK_CHANNEL_WEBHOOK
# Example: ./memory-slack-alert.sh projectx-serverx 54 https://hooks.slack.com/services/XXXXXXXXXX/XXXXXXXXXX/XXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
#-------------------------------------


SERVER_NAME=$1
THRESHOLD=$2
channel_webhook=$3

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
#----------------------------------------------------------------------------------------------

musage=$(free | awk '/Mem/{printf("RAM Usage: %.2f%\n"), $3/$2*100}' |  awk '{print $3}' | cut -d"." -f1)
if [ $musage -ge $THRESHOLD ]; then

curl -X POST -H 'Content-type: application/json' --data "{\"text\":\" :warning: WARNING: Your server \`$(hostname)\` $SERVER_NAME IP $PrivateIP InstanceID $InstanceID Memory usage is currently at *${musage}%* .\n \`\`\`$(free -h)\`\`\` \"}" $CHANNEL
fi

# ------------- END Of Script --------------------------

