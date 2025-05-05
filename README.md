# Yolo E-Commerce Platform Automation with Ansible & Terraform

This project automates the deployment of a containerized e-commerce platform using **Ansible** and **Terraform**. The application features a client, backend, and MongoDB database, all running in Docker containers.

## 🚀 Project Structure

Yolo ecommerce-ansible/
├── Vagrantfile
├── inventory
├── playbook.yml
├── vars/
│ └── main.yml
├── roles/
│ ├── mongodb/
│ ├── backend/
│ └── frontend/
├── stage_two/
│ ├── terraform/
│ │ ├── main.tf
│ │ ├── variables.tf
│ │ ├── outputs.tf
│ │ └── inventory.ini
│ └── ansible/
│ ├── playbook.yml
│ └── roles/
├── explanation.md
└── README.md

## Stage 1: Ansible Configuration with Vagrant

1. `vagrant up` - Provisions an Ubuntu VM using the Jeff Geerling base image.
2. `ansible-playbook -i inventory playbook.yml` - Installs Docker, clones the app, and runs it in containers.

### Key Features
- Uses roles for **MongoDB**, **backend**, and **client**
- Role-based separation of concerns
- Docker-based container orchestration
- GitHub code cloning
- Fully automated provisioning and setup

## Test the Application

Once the playbook finishes:
- Visit `http://localhost:3000` to access the client.
- Use the "Add Product" form to verify full stack functionality.

## Stage 2: Terraform + Ansible

In `stage_two/`, we integrate Terraform to provision infrastructure and trigger Ansible:

```bash
cd stage_two/terraform
terraform init
terraform apply
Terraform provisions a VM or local environment, generates an Ansible inventory, and runs the same role-based setup.

# Terraform provisions a VM or local environment, generates an Ansible inventory, and runs the same role-based setup.

## Deliverables
Vagrantfile (Stage 1)
Terraform scripts (Stage 2)
Ansible roles & playbook
Working app with persistence