# Monitoring Scripts with Slack Alerts

This repository contains multiple shell scripts designed to monitor various aspects of server performance and send alerts to a specified Slack channel when thresholds are exceeded. These scripts are mainly tailored for use with AWS EC2 instances, but they can be modified for use in other cloud environments.

## Overview

The repository includes monitoring scripts for:

1. **Disk Space Monitoring**: Sends alerts when disk usage exceeds a specified threshold.
2. **RabbitMQ Node Health Monitoring**: Sends alerts if the RabbitMQ node health is unhealthy.
3. **Memory Usage Monitoring**: Sends alerts when memory usage exceeds a specified threshold.

Each script is placed in its own directory, with a corresponding `README.md` file detailing how to set up and use the script.

## Repository Structure

```
/Monitoring-Shell-Scripts/
│
├── disk-space-monitoring/
│   ├── diskspace-slack-alert.sh
│   └── README.md
│
├── rabbitmq-health-monitoring/
│   ├── rabbitmq-node-health-slack-alert.sh
│   └── README.md
│
├── memory-monitoring/
│   ├── memory-slack-alert.sh
│   └── README.md
│
└── LICENSE
```

## How to Use

### 1. Clone the Repository

Clone this repository to your desired location on your server:

```bash
git clone <repository-url>
```

### 2. Navigate to Specific Monitoring Script Directory

Each script is located in its own sub-directory. Navigate to the appropriate directory for the script you want to use:

- **Disk Space Monitoring**:
  ```bash
  cd Monitoring-Shell-Scripts/disk-space-monitoring
  ```

- **RabbitMQ Health Monitoring**:
  ```bash
  cd Monitoring-Shell-Scripts/rabbitmq-health-monitoring
  ```

- **Memory Usage Monitoring**:
  ```bash
  cd Monitoring-Shell-Scripts/memory-monitoring
  ```

### 3. Follow Instructions in Each Script's `README.md`

Each script has its own `README.md` with detailed instructions on how to set it up, including setting up cron jobs for continuous monitoring.

## Customization

Although these scripts are optimized for AWS EC2, they can be modified for use with other cloud providers or non-cloud environments by changing how instance metadata is retrieved and other relevant adjustments.

## Adding More Scripts

If you want to add more monitoring scripts to this repository, follow these steps:

1. Create a new directory for your script in the root directory.
2. Add your script and include a `README.md` in the new directory.
3. Follow the structure and format used in the existing scripts to maintain consistency.

## License

This project is licensed under the MIT License. See the `LICENSE` file for more details.

## Contributing

Contributions are welcome! If you want to improve the existing scripts or add new ones, feel free to submit a pull request. Please ensure each new script is in its own directory with a corresponding `README.md` file for instructions.

