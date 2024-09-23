# Memory Usage Monitoring Script with Slack Alerts

This directorry contains a shell script that monitors memory usage on an AWS EC2 instance and sends an alert to a specified Slack channel if the memory usage exceeds a certain threshold. The script provides the instance ID, private IP, and current memory usage details in the alert.

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
   Copy the script to `/customscripts`.

2. **Make the Script Executable**: Ensure the script has execute permissions:
   ```bash
   chmod +x /customscripts/memory-slack-alert.sh
   ```

3. **Run the Script**: Run the script with the following arguments:
   ```bash
   sh /customscripts/memory-slack-alert.sh <SERVER_NAME> <THRESHOLD> <SLACK_WEBHOOK_URL>
   ```

   - `SERVER_NAME`: A label or name to identify the server.
   - `THRESHOLD`: The memory usage percentage that will trigger the alert (e.g., `75` for 75%).
   - `SLACK_WEBHOOK_URL`: The Slack webhook URL to send the alert to.

   ### Example:
   ```bash
   sh /customscripts/memory-slack-alert.sh projectx-serverx 75 https://hooks.slack.com/services/XXXXXXXXXX/XXXXXXXXXX/XXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
   ```

4. **Set up a Cron Job**: To monitor memory usage regularly, set up a cron job to run the script at your desired interval (e.g., every 10 minutes):
   ```bash
   crontab -e
   ```
   Add the line:
   ```bash
   */10 * * * * /bin/bash /customscripts/memory-slack-alert.sh <SERVER_NAME> <THRESHOLD> <SLACK_WEBHOOK_URL>
   ```

## Example Output

When the memory usage exceeds the threshold, the script sends an alert to the specified Slack channel with details like instance ID, private IP, and current memory usage.

### Example Alert:
```
:warning: WARNING: Your server `projectx-serverx` IP 172.31.10.1 InstanceID i-0123456789abcdef Memory usage is currently at 78%.
```

## Troubleshooting

- Ensure that the script has execute permissions:
  ```bash
  chmod +x /customscripts/memory-slack-alert.sh
  ```
- Check the cron job logs if the script does not run as expected:
  ```bash
  grep CRON /var/log/syslog
  ```

## Customization

This script is currently configured for AWS EC2 instances, but you can modify it for use with other cloud providers by changing how the instance ID and metadata are fetched.

## Contributing

Feel free to submit issues or pull requests if you have suggestions for improvements or bug fixes.

## License

This project is licensed under the MIT License.
