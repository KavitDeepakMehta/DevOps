#The objective is to deploy an Apache web server inside a Docker container on an EC2 instance running Ubuntu 20.04. The process involves pulling the Apache image from Docker Hub, setting up a container runtime environment on EC2, and deploying a web application with an index.html file.
sudo su # Switches the current user to the root user with elevated privileges.
apt update -y # Updates the list of available packages and their versions, automatically accepting any prompts.
apt install apt-transport-https ca-certificates curl software-properties-common # Installs packages required for HTTPS connections, certificate handling, file transfer, and managing software repositories.
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add - # Downloads Docker's GPG key and adds it to the system's trusted keys for package verification.
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable" # Adds Docker’s official repository for the stable release on Ubuntu Focal (20.04) to the system’s package sources.
apt-cache policy docker-ce # Displays the version information and installation candidate for Docker's Community Edition.
sudo apt install docker-ce # Installs Docker's Community Edition on the system.
docker --version # Checks and displays the installed version of Docker.
docker pull ubuntu # Downloads the latest Ubuntu image from Docker Hub.
docker container run ubuntu # Runs a new container using the Ubuntu image.
docker container ls -a # Lists all Docker containers, including those that are stopped.
docker container rm <CONTAINER_ID> # Removes a Docker container specified by the container ID.
docker container ls -a # Lists all Docker containers again to confirm removal.
docker container run -it ubuntu /bin/bash # Runs a new Ubuntu container in interactive mode with a bash shell.

#Inside the container commands
apt update -y # Updates the list of available packages and their versions, automatically accepting any prompts.
apt install apache2 -y # Installs the Apache2 web server, automatically accepting any prompts.
service apache2 status # Checks and displays the current status of the Apache2 service.
service apache2 start # Starts the Apache2 service if it is not already running.
service apache2 status # Re-checks and displays the status of the Apache2 service after attempting to start it.
cd /var/www/html # Changes the current directory to Apache’s default web root directory.
echo "This is Docker Container" > index.html # Creates or overwrites the index.html file with the text "This is Docker Container" in the current directory.
cat index.html # Displays the contents of the index.html file.

#Commands for New Session in Same EC2 Instance
sudo su # Switches the current user to the root user with elevated privileges.
docker container inspect <INSIDE_CONTAINER_ID> # Retrieves detailed information in JSON format about the specified Docker container, identified by its ID.
curl http:/<IP_ADDRESS_OF_INSPECTED_DOCKER_CONTAINER> # Sends an HTTP request to the specified IP address of the Docker container, typically to check if a service (like a web server) is running and accessible.