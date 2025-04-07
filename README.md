# Nginx Deployment with Docker, Terraform, and Ansible

This project automates the deployment of an Nginx web server with SSL, accessible via a dynamic DNS (e.g., `v12.testte.pp.ua`) based on a GitHub tag.

## Prerequisites
- AWS CLI configured with credentials
- Terraform installed
- Ansible installed
- Docker and Docker Compose installed locally
- SSH key pair uploaded to AWS
- Route 53 Hosted Zone for `testte.pp.ua`

## Project Structure
- `docker/` - Dockerfile, Nginx config, and Docker Compose setup
- `terraform/` - AWS infrastructure and Route 53 DNS
- `ansible/` - Server configuration, SSL setup, and deployment

## Local Setup
1. Navigate to `docker/`:
   ```bash
   cd docker