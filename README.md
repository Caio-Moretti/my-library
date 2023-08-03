![banner](/img/Banner.png)
# My Library (Práticas DevOps)

This project showcases a basic library website deployed on AWS using IaC, Docker, CI/CD and monitoring.

## Table of Contents

- [Project Title](#project-title)
  - [Table of Contents](#table-of-contents)
  - [Introduction](#introduction)
  - [File Structure](#file-structure)
  - [Getting Started](#getting-started)
    - [Prerequisites](#prerequisites)
    - [Installation](#installation)
  - [Usage](#usage)
  - [Built With](#built-with)
  - [Contributing](#contributing)
  - [Next Steps](#next-steps)

## Introduction

This challenge was undertaken to complete the "DevOps Practices" track of AsCan, a developmental project for interns at Instituto Atlântico. The main objective was to create a simple website that could be deployed on AWS using Infrastructure as Code (IaC) tools such as Terraform, containerized with Docker, and integrated with CI/CD practices, while incorporating monitoring capabilities.

The website developed is a basic library platform, allowing users to add books and rate them. The infrastructure was set up using an AWS EC2 instance, which is monitored with AWS CloudWatch. This EC2 instance runs a Docker image sourced from DockerHub, containing the application built with Flask, a Python library. The AWS resources were deployed using Terraform for Infrastructure as Code, and all commands (for managing the EC2 instance and updating the Docker image) are executed through GitHub Actions workflows, triggered whenever modifications are made to the Terraform or application code. These workflows are triggered through Pull Requests (for example: the terraform plan workflow) and pushes to the main branch (for example: the terraform apply workflow).

## File Structure

The file structure of this project is organized as follows:
```bash
.
├── .github/workflows
│   ├── docker_update.yml
│   ├── ec2_update.yml
│   ├── terraform_apply.yml
│   ├── terraform_destroy.yml
│   └── terraform_plan.yml
├── .idea
├── app
│   ├── static
│   │   └── img
│   │       ├── 1_star_rating.png
│   │       ├── 2_star_rating.png
│   │       ├── 3_star_rating.png
│   │       ├── 4_star_rating.png
│   │       ├── 5_star_rating.png
│   │       └── book_logo.png
│   └── templates
│       └── library.html
│   ├── flask-app.py
├── terraform
│   ├── ec2.tf
│   ├── main.tf
│   ├── sg.tf
│   ├── variables.tf
│   └── vpc.tf
├── .gitignore
├── Dockerfile
├── LICENSE
├── README.md
├── docker-compose.yml
└── requirements.txt
```


## Getting Started 

### Prerequisites

Before setting up the project, make sure you have the following prerequisites:

1. **GitHub Account:** You will need a GitHub account to access the repository and set up the secrets.

2. **AWS Account:** To deploy the infrastructure on AWS, you'll need an AWS account with access to IAM and EC2.

3. **Docker Hub Account:** You'll need a Docker Hub account to push and pull Docker images.

4. **SSH Key Pair:** Generate an SSH key pair (public and private) to securely access the AWS EC2 instance.
   ```powershell
     ssh-keygen -b 4096
     cd C:/Users/WINUSER/.ssh/id_rsa.pub
    ```

> Make sure you have the necessary credentials and accounts ready before proceeding with the project setup.

### Installation


To set up the project, follow these steps:

1. **Clone the Repository:**

```bash
git clone <repository_url>
cd <repository_directory>
```

2. **Set Up Secrets:**
  - Go to your GitHub repository.
  - Click on "Settings" in the top-right menu.
  - In the left sidebar, click on "Secrets."
  - Click on "New repository secret" and add the following secrets:
    - `AWS_ACCESS_KEY`: Your AWS access key.
    - `AWS_SECRET_KEY`: Your AWS secret key.
    - `DOCKER_USERNAME`: Your Docker Hub username.
    - `DOCKER_PASSWORD`: Your Docker Hub password.
    - `PRIVATE_KEY`: Your private SSH key.

3. **Create a Pull Request:**
  - Make a small change or add a comment in any file inside the "app" folder and create a new branch.
  - Push the branch to GitHub and create a Pull Request (PR) to the main branch.

4. **Review and Merge the Pull Request:**
  - Review the changes in the PR, and if everything looks good, approve the PR.
  - Merge the PR into the main branch.
  - This will trigger the "Docker build, Docker push, and Reset EC2 instance" workflow, deploying all the infrastructure.

> **Terraform Workflows:**
>
> If you want to run only the terraform plan and terraform apply commands, without pushing the docker image you can follow the next steps:
>  - Create a new branch and make a small change or add a comment in any file inside the "terraform" folder
>  - Push the branch to GitHub and create a Pull Request (PR) to the main branch.
>  - This will trigger the "terraform plan" workflow, planning the deployment of the infrastructure
>  - Review the changes in the PR, and if everything looks good, approve the PR.
>  - Merge the PR into the main branch.
>  - This will trigger the "terraform apply" workflow, deploying all the infrastructure.

  
> Please exercise caution when making changes to the Terraform code, as it will modify your AWS infrastructure. Always review the changes carefully before approving and merging the PRs. Enjoy working with the project and exploring its capabilities!



## Usage

After the deploy, you can access the websiste from the EC2 public IP. Example: ```(public ip)x.x.x.x:5000/library```

image(TBD)

## Built With

This project was built using the following technologies, frameworks, and tools:

- AWS (Amazon Web Services)
- Terraform (Infrastructure as Code)
- Docker (Containerization)
- GitHub Actions (Continuous Integration and Continuous Deployment)
- Python (Flask framework for the web application)
- GitHub (Version control and project management)


## Contributing

We welcome contributions to this project! If you want to contribute, please follow these guidelines:

### Bug Reports and Feature Requests

If you encounter a bug or have a feature request, please check the existing issues on GitHub to see if it has already been reported. If not, you can create a new issue and provide detailed information about the bug or feature you are suggesting. Be sure to include steps to reproduce the bug or a clear description of the feature you'd like to see.

### Pull Requests

If you want to contribute code to the project, you can do so by creating a pull request (PR) with your changes. Here's how to do it:

1. Fork the repository to your GitHub account.

2. Clone your forked repository to your local machine.

3. Create a new branch for your changes:

```bash 
git checkout -b my-feature
```

4. Make your changes and commit them with descriptive commit messages:

```bash
git add .
git commit -m "Add new feature"
```

5. Push the changes to your forked repository:

```bash
git push origin my-feature
```


6. Open a pull request from your branch to the main repository's `main` branch.

7. Provide a detailed description of your changes in the pull request, including any relevant context or information.

8. Wait for feedback and address any review comments if necessary.

Once your pull request is approved and merged, your changes will become part of the project. Thank you for contributing!

Before submitting a pull request, please ensure that your code follows the project's coding standards and that all tests pass successfully.

## Next Steps
- Make website frontend better.
- Add a Log In system.
- Add database service such as RDS or DynamoDB

---

![ending](/img/Ending.png)
