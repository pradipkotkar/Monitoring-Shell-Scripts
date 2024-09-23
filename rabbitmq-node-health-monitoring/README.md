# RabbitMQ Node Health Monitoring Script with Slack Alerts

This directory contains a shell script that monitors the health of a RabbitMQ node and sends an alert to a specified Slack channel if the node is unhealthy. The script retrieves the instance ID, private IP, and RabbitMQ node status to provide context in the alert.

## Requirements

- **RabbitMQ**: This script monitors a RabbitMQ node running on the local machine.
- **AWS EC2**: The script is tailored for AWS EC2 instances, but it can be adapted for other environments by modifying how instance metadata is fetched.
- **Slack Webhook**: You need a Slack incoming webhook URL to send alerts to your desired Slack channel.
- **jq**: The script uses `jq` to parse JSON responses from RabbitMQ API. Install `jq` if it's not available:
  ```bash
  sudo apt-get install jq
  ```

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
   chmod +x /customscripts/rabbitmq-node-health-slack-alert.sh
   ```

3. **Run the Script**: Run the script with the following arguments:
   ```bash
   sh /customscripts/rabbitmq-node-health-slack-alert.sh <RABBITMQ_USER> <RABBITMQ_PASSWORD> <SLACK_WEBHOOK_URL>
   ```

   - `RABBITMQ_USER`: RabbitMQ username.
   - `RABBITMQ_PASSWORD`: RabbitMQ password.
   - `SLACK_WEBHOOK_URL`: The Slack webhook URL to send the alert to.

   ### Example:
   ```bash
   sh /customscripts/rabbitmq-node-health-slack-alert.sh admin password123 https://hooks.slack.com/services/XXXXXXXXXX/XXXXXXXXXX/XXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
   ```

4. **Set up a Cron Job**: To monitor the RabbitMQ node health regularly, set up a cron job to run the script at your desired interval (e.g., every 5 minutes):
   ```bash
   crontab -e
   ```
   Add the line:
   ```bash
   */5 * * * * /bin/bash /customscripts/rabbitmq-node-health-slack-alert.sh <RABBITMQ_USER> <RABBITMQ_PASSWORD> <SLACK_WEBHOOK_URL>
   ```

## Example Output

If the RabbitMQ node is unhealthy, an alert is sent to the specified Slack channel with details like instance ID, private IP, and the RabbitMQ node health status.

### Example Alert:
```
:alert: Your server RabbitMQ node `ProjectX-ServerX` IP 172.31.10.1 InstanceID i-0123456789abcdef is unhealthy. Status: failed
```

## Troubleshooting

- Ensure that RabbitMQ management plugin is enabled to access the `/api/healthchecks/node` endpoint:
  ```bash
  rabbitmq-plugins enable rabbitmq_management
  ```
- Check if `jq` is installed on the system for parsing JSON:
  ```bash
  sudo apt-get install jq
  ```
- If the script fails, check the script permissions and ensure the RabbitMQ service is running.

## Customization

This script is configured for RabbitMQ running on localhost, but you can modify the `RABBITMQ_HOST` variable if RabbitMQ is running on a different server. Additionally, the script is currently optimized for AWS EC2 instances. For other cloud environments, modify how instance metadata is retrieved.

## Contributing

Feel free to submit issues or pull requests if you have suggestions for improvements or bug fixes.

## License

This project is licensed under the MIT License.
