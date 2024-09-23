# Disk Space Monitoring Script with Slack Alerts
This repository contains a shell script that monitors disk space usage on an AWS EC2 instance and sends an alert to a specified Slack channel when the disk usage exceeds a certain threshold. The script fetches the instance ID, private IP, and other details to provide context in the alert.

## Requirements

- **AWS EC2**: This script is specifically tailored for AWS EC2 instances, but it can be modified for use in other cloud environments.
- **Slack Webhook**: You need a Slack incoming webhook URL to send alerts to your desired Slack channel.

## How to Use

1. **Clone or Copy the Script**: Clone or copy this script to your desired location on the EC2 instance.
   
   Example directory:
   ```bash
   mkdir /customscripts
   cd /customscripts
   git clone <repository-url>
   ```
   Copy the script to /customscripts

2. **Setup a Cron Job**: Set up a cron job to run the script at your desired interval. For example, to run the script every hour:
   ```bash
   crontab -e
   ```
   Add the line in following format:
   ```bash
   0 * * * * /bin/bash /customscripts/disk-space-slack-alert.sh <projectname-servername> <disk> <threshould> <slack-webhook>
   ```
   Example:
   ```bash
   0 * * * * /bin/bash /customscripts/disk-space-slack-alert.sh ProjectX-ServerX / 80 https://hooks.slack.com/services/XXXXXXXXXX/XXXXXXXXXX/XXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
   ```

3. **Test the Script**: Run the script manually to ensure it works as expected. lower down the threshould. Example: 
   ```bash
   /bin/bash /customscripts/disk-space-slack-alert.sh ProjectX-ServerX / 10 https://hooks.slack.com/services/XXXXXXXXXX/XXXXXXXXXX/XXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
   ```

## Example Output

When the disk usage exceeds the threshold, the script sends an alert to the specified Slack channel with details like instance ID, private IP, and current disk usage including all disks.

## Troubleshooting

- Ensure that the script has execute permissions:
  ```bash
  chmod +x /customscripts/disk-space-slack-alert.sh
  ```
- Check the cron job logs if the script does not run as expected:
  ```bash
  grep CRON /var/log/syslog
  ```

## Contributing

Feel free to submit issues or pull requests if you have suggestions for improvements or bug fixes.

## License

This project is licensed under the MIT License.