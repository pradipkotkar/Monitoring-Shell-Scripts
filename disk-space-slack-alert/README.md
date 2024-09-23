Disk Space Monitoring with Slack Alerts

This script monitors disk space on a specified server and sends a Slack alert when the disk usage exceeds a defined threshold. It's designed to help system administrators keep track of disk usage and receive timely alerts on Slack.
Prerequisites

Before using this script, ensure you have the following:

    Slack Incoming Webhook URL: You'll need to set up a Slack Incoming Webhook to receive alerts in your Slack workspace. You can follow Slack's Incoming Webhooks Guide to get your webhook URL.

    Custom Scripts Directory: This script should be placed in a directory such as /customscripts/ on your server.

    Execute Permission: Ensure the script has execution permission using the following command:

    bash

    chmod +x /customscripts/diskspace-slack-alert.sh

How to Use

    Place the Script: Create a directory for custom scripts and place the diskspace-slack-alert.sh script in it:

    bash

mkdir -p /customscripts
cp diskspace-slack-alert.sh /customscripts/

Run the Script: Use the following syntax to run the script:

bash

sh /customscripts/diskspace-slack-alert.sh <SERVER_NAME> <DISKNAME> <THRESHOLD> <SLACK_WEBHOOK_URL>

    SERVER_NAME: The name or identifier of the server (for example: projectx-jenkins).
    DISKNAME: The disk or partition to monitor (for example: / for root partition).
    THRESHOLD: The disk usage percentage that will trigger the alert (for example: 54).
    SLACK_WEBHOOK_URL: The Slack Incoming Webhook URL for the channel where alerts should be sent.

Example Command:

bash

sh /customscripts/diskspace-slack-alert.sh projectx-jenkins / 54 https://hooks.slack.com/services/XXXXXXXXXX/XXXXXXXXXX/XXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

Alert Structure: When the disk usage crosses the defined threshold, the script will send a Slack alert in the following format:

ruby

    :warning: WARNING: Your server `SERVER_NAME` IP `PRIVATE_IP` InstanceID `INSTANCE_ID` disk `DISKNAME` is currently at `CURRENT_USAGE%` capacity.

Monitoring Multiple Disks

To monitor multiple disks, you can schedule the script using a cron job or invoke the script for each disk with different parameters.
Example Cron Job:

To run this script every hour and monitor the root disk, you can add the following line to your crontab:

bash

0 * * * * sh /customscripts/diskspace-slack-alert.sh projectx-jenkins / 80 https://hooks.slack.com/services/XXXXXXXXXX/XXXXXXXXXX/XXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

Future Enhancements

    Extend support for multiple disks automatically.
    Add more alerting channels like email or other messaging platforms.

License

This script is open-source and licensed under the MIT License. Contributions are welcome.

