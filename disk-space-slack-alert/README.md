# Disk Space Slack Alert Script

This Bash script monitors disk space usage on a specified disk and sends an alert to a Slack channel if the usage exceeds a defined threshold.

## Features

- Monitors specified disk space usage
- Sends alerts to a Slack channel when usage exceeds the threshold
- Automatically retrieves EC2 instance details (Instance ID and Private IP)

## Prerequisites

- Bash shell
- Access to a Linux environment with the `curl` command installed
- A Slack webhook URL for sending notifications

## Installation

1. Create a directory to store your custom scripts:

   ```bash
   mkdir /customscripts
