# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/), and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.0.0] - 2024-09-23

### Added
- Initial release of the project with basic monitoring scripts for disk space, RabbitMQ node health, and memory usage.

- `diskspace-slack-alert.sh` script to monitor disk space usage and send alerts to Slack.
- `rabbitmq-node-health-slack-alert.sh` to monitor RabbitMQ node health and notify via Slack.
- `memory-slack-alert.sh` for tracking memory usage and sending notifications when thresholds are exceeded.
