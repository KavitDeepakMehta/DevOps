# DevOps Custom Docker in EC2 (Ubuntu 24.04)

## Aim

In EC2 Instance of Ubuntu 24.04 Version, Create a Custom Image in which 2 
Docker Containers are made and Apache2 is Installed and Deployed on EC2 
Machine working inside.

## Architecture

![CustomDockerContainerUbuntu24 04](https://github.com/user-attachments/assets/35ba6f1a-f423-48eb-b768-d10982966a54)

## Steps
### 1. Launch an EC2 instance

Name : Custom-Docker-Container

AMI : Ubuntu 24.04

Instance type : t2.micro

Launch instance

### 2. Connect to your EC2 Instance

`sudo apt update -y`: Updates the package lists and upgrades all installed packages to the latest versions.

`sudo apt upgrade -y`: Installs the latest versions of all packages currently installed on the system without requiring confirmation.

`sudo apt install apt-transport-https ca-certificates curl software-properties-common -y`: Installs packages required for downloading and verifying packages over HTTPS.

`curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc`: Downloads the Docker GPG key and saves it for verifying Docker packages.

`echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null`**: Adds Docker's official stable repository to your system's APT sources list.

`sudo apt update -y`: Updates the package lists to include packages from the newly added Docker repository.

`sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y`: Installs Docker Engine, Docker CLI, containerd, and Docker Compose plugins.

`sudo systemctl start docker`: Starts the Docker service on your system.

`sudo docker images`: Lists all Docker images stored on your system.

`sudo nano CustomDockerfile`: Opens the `CustomDockerfile` in the Nano text editor for editing.

`sudo docker build -f CustomDockerfile -t kavitkaimage .`: Builds a Docker image named `kavitkaimage` using the instructions in `CustomDockerfile`.

`sudo docker container run -it kavitkaimage /bin/bash`: Runs a container from the `kavitkaimage` image and opens an interactive terminal session inside it.

vi CustomDockerfile (Code)

### 4. Take a new session of same instance in new Command Prompt and write as follows:

docker ps -a

docker container inspect <iamge_id>

curl http://172.17.0.2

### 5. To do versioning of docker container, you need to make changes in your CustomDockerfile and build a image with new tag. So follow the below steps:

sudo nano CustomDockerfile

sudo docker build -f CustomDockerfile -t kavitkaimage:v1.1 .

sudo docker container run -it kavitkaimage:v1.1 /bin/bash

Also Don’t forget to run your Apache2 after entering the /bin/bash : service apache2 start

### 6. Take a 3rd New Session (Make sure your first docker container is up and running or else there will be no new IP address assigned to your new docker container)

docker ps -a

docker container inspect <iamge_id>

curl http://172.17.0.3

## Documentation Link

https://docs.google.com/document/d/1tCxIRuhQaz_yNkRaRz_cInPeEABQz1_eQxM9kArFBYk/edit?usp=sharing

## Expected Outcome

I’ve successfully created reliable custom images with versioning on my EC2 instance, ensuring consistent deployments. My Docker setup with two containers is up and running smoothly. Apache2 is installed and deployed without issues, proving I can manage and configure web servers effectively. Overall, I’ve built a solid environment for future projects.
