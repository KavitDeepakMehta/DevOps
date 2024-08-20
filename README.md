# DevOps Docker In EC2 (Ubuntu 20.04)

## Aim

In EC2 Instance of Ubuntu 20.04 Version, Create a Docker Container where 
Apache2 is Installed and Deployed on EC2 Machine working inside.

## Architecture

![Docker_IN_EC2_Ubuntu_20 04](https://github.com/user-attachments/assets/23d5b561-4fd7-4443-8ad0-87047f2693f1)

## Steps
### 1. Launch an EC2 Instance
• Name : Docker_Instance
• AMI : Ubuntu 20.04
• Instance Type : c1.xLarge
• Launch Instance

### 2. Write the following commands to Create a Docker container
1. `sudo su`: Switches the current user to the root user with elevated privileges.
2. `apt update -y`: Updates the list of available packages and their versions, automatically accepting any prompts.
3. `apt install apt-transport-https ca-certificates curl software-properties-common`: Installs packages required for HTTPS connections, certificate handling, file transfer, and managing software repositories.
4. `curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -`: Downloads Docker's GPG key and adds it to the system's trusted keys for package verification.
5. `sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"`: Adds Docker’s official repository for the stable release on Ubuntu Focal (20.04) to the system’s package sources.
6. `apt-cache policy docker-ce`: Displays the version information and installation candidate for Docker's Community Edition.
7. `sudo apt install docker-ce`: Installs Docker's Community Edition on the system.
8. `docker --version`: Checks and displays the installed version of Docker.
9. `docker pull ubuntu`: Downloads the latest Ubuntu image from Docker Hub.
10. `docker container run ubuntu`: Runs a new container using the Ubuntu image.
11. `docker container ls -a`: Lists all Docker containers, including those that are stopped.
12. `docker container rm <CONTAINER_ID>`: Removes a Docker container specified by the container ID.
13. `docker container run -it ubuntu /bin/bash`: Runs a new Ubuntu container in interactive mode with a bash shell.

### 3. Write the following Commands Inside the Container:
1. `apt update -y`: Updates the list of available packages and their versions, automatically accepting any prompts.
2. `apt install apache2 -y`: Installs the Apache2 web server, automatically accepting any prompts.
3. `service apache2 status`: Checks and displays the current status of the Apache2 service.
4. `service apache2 start`: Starts the Apache2 service if it is not already running.
5. `service apache2 status`: Re-checks and displays the status of the Apache2 service after attempting to start it.
6. `cd /var/www/html`: Changes the current directory to Apache’s default web root directory.
7. `echo "This is Docker Container" > index.html`: Creates or overwrites the `index.html` file with the text "This is Docker Container" in the current directory.
8. `cat index.html`: Displays the contents of the `index.html` file.

### 4. Write the following Commands in New Session of Same EC2 Instance in New Command Prompt:
1. `sudo su`: Switches the current user to the root user with elevated privileges.
2. `docker container inspect <INSIDE_CONTAINER_ID>`: Retrieves detailed information in JSON format about the specified Docker container, identified by its ID.
3. `curl http://<IP_ADDRESS_OF_INSPECTED_DOCKER_CONTAINER>`:Sends an HTTP request to the specified IP address of the Docker container, typically to check if a service (like a web server) is running and accessible.

## Documentation Link

https://docs.google.com/document/d/1D7t1M5oBFyX9libRH-DctTwtMbjloadL7UlAAkj2-IQ/edit?usp=sharing

## Expected Outcome

The expected outcome is a Docker container running Apache2 on an Ubuntu 20.04 EC2 instance. Apache2 should be accessible via the EC2 instance's public IP, with port 80 bound to the container. The setup ensures the web server is isolated within the container while being reachable externally, with persistent data and proper networking configurations in place.
