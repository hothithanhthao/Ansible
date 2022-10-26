### Remote management - Ansible

### How to build
1. Clone the project
2. Navigate for exercise folder
`cd Ansible/`
3. Build Docker image
`docker build -t ansible .`


### How to test
1. Run first docker container from previous build image (name it as ansible1 and port 2022)
`docker run -d -p 2022:22 --name ansible-1 ansible`
2. Add first container port to the hosts file (./inv/hosts)
`ansible_port=2022`
Other configurations keep the same.
3. Run the playbook
`ansible-playbook ansible.yml`
4. Run second container from previous build image (name it as ansible2 and port 2222)
`docker run -d -p 2222:22 --name ansible-2 ansible`
5. Add first container port to the hosts file (./inv/hosts)
`ansible_port=2222`
Other configurations keep the same.
6. Run the playbook again
`ansible-playbook ansible.yml`

# 5. Orchestration
## Table of contents
* [General info](#general-info)
* [Setup](#setup)

## General info
This project is a simple exercise for creating ansible service

## Setup

### How to build
1. Clone the project
2. Navigate for exercise folder
`cd Ansible/`
3. Build Docker image
`docker build -t ansible .`

### How to test
1. Run first docker container from previous build image (name it as ansible1 and port 2022)
`docker run -d -p 2022:22 --name ansible-1 ansible`
2. Add first container port to the hosts file (./inv/hosts)
`ansible_port=2022`
Other configurations keep the same.
3. Run the playbook
`ansible-playbook ansible.yml`
4. Run second container from previous build image (name it as ansible2 and port 2222)
`docker run -d -p 2222:22 --name ansible-2 ansible`
5. Add first container port to the hosts file (./inv/hosts)
`ansible_port=2222`
Other configurations keep the same.
6. Run the playbook again
`ansible-playbook ansible.yml`

