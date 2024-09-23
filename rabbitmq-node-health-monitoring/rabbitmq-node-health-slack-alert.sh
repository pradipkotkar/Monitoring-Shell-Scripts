#!/bin/bash

# Script to monitor RabbitMQ node health and send alerts to Slack
# Usage:
# 1. Save this script as `rabbitmq-node-health-slack-alert.sh`
# 2. Make the script executable: `chmod +x rabbitmq-node-health-slack-alert.sh`
# 3. Run the script with the RabbitMQ username, password, and Slack webhook URL as arguments:
#    sh rabbitmq-node-health-slack-alert.sh <RABBITMQ_USER> <RABBITMQ_PASSWORD> <SLACK_WEBHOOK_URL>


# RabbitMQ node details
HOSTNAME=$(hostname)
RABBITMQ_HOST="localhost"
RABBITMQ_PORT=15672
RABBITMQ_USER=$1
RABBITMQ_PASSWORD=$2
PrivateIP=$(hostname -I)

# Slack webhook URL
SLACK_WEBHOOK_URL=$3


#Fetch InstanceID
EC2_InstanceID_TAG_FILE="/tmp/EC2_InstanceID"

if [ -f "$EC2_InstanceID_TAG_FILE" ]; then
    InstanceID=$(cat "$EC2_InstanceID_TAG_FILE")
fi

if [ -z "$InstanceID" ]; then
    InstanceID=$(curl http://169.254.169.254/latest/meta-data/instance-id 2>/dev/null) && echo "$InstanceID"
    echo "$InstanceID" > "$EC2_InstanceID_TAG_FILE"
fi


# Check RabbitMQ node health
check_rabbitmq_health() {
    local status=$(curl -s -u $RABBITMQ_USER:$RABBITMQ_PASSWORD http://$RABBITMQ_HOST:$RABBITMQ_PORT/api/healthchecks/node | jq -r '.status')
    echo $status
}

# Monitoring alert
status=$(check_rabbitmq_health)
if [ "$status" = "ok" ] ; then
#send_slack_alert "RabbitMQ node $HOSTNAME is unhealthy: $status"
#curl -X POST -H 'Content-type: application/json' --data "{:alert: Your server RabbitMQ node \`$(hostname)\` is unhealthy: $status}" $SLACK_WEBHOOK_URL
curl -X POST -H 'Content-type: application/json' --data "{\"text\":\" :alert: Your server RabbitMQ node \`$(hostname)\ IP $PrivateIP InstanceID $InstanceID is unhealthy. status: $status\"}" $SLACK_WEBHOOK_URL
fi

# END Of Script ----------------------
