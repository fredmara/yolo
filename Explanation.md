# Explanation of Ansible Playbook Structure

This document explains the rationale and structure of the Ansible and Terraform automation scripts used to deploy the containerized e-commerce application.

## Order of Execution: `playbook.yml`

```yaml
- hosts: all
  become: true
  vars_files:
    - vars/main.yml

  roles:
    - { role: mongodb, tags: mongo }
    - { role: backend, tags: backend }
    - { role: client, tags: client }
The playbook executes MongoDB first, followed by backend, then client. This order ensures dependencies (like the database) are available before application layers interact with them.

## Role Descriptions
1. mongodb/
- Installs Docker (if not already)

- Creates a Docker container running MongoDB on default port 27017

- Sets volume mount for data persistence

2. backend/
- Pulls the Node.js image

- Mounts the backend code cloned from GitHub

- Installs dependencies and runs the backend server on port 5000

- Connects to the MongoDB container internally

3. client/
- Builds and runs the frontend React application

- Exposes it on port 3000

## Variables (vars/main.yml)

mongo_port: 27017
backend_port: 5000
client_port: 3000
- Defined once and reused across roles for flexibility and maintainability.

# Terraform Integration
## Terraform Setup
- Generates an Ansible inventory file automatically

- Uses local-exec to run Ansible playbook after provisioning

- Simplifies deployment into a single command (terraform apply)

### NB.
To ensure data privacy, the Terraform state file is pushed to GitHub without sensitive variables or backup state files to prevent leakage.

## Testing Criteria
- The app launches in the browser after provisioning

- The "Add Product" form works and persists data

- Docker containers are created and running

- Playbook can be re-run without repeatition.

## Tags & Blocks
Tags were added to each role:

tags: mongo, backend, client.
This allows partial playbook runs using:

ansible-playbook playbook.yml --tags "backend"

In Summary
This automation project demonstrates:

1. Practical use of Ansible roles
2. Variable-driven configuration
3. Modular provisioning using Terraform and Ansible
4. Real-world container orchestration

This architecture is scalable, repeatable, and suitable for CI/CD or team workflows.
