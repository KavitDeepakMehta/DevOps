# DevOps Custom Docker Using EC2 and ECR (Amazon Linux 2023)

## Aim

In EC2 Instance of Amazon Linux 2023 Version, Create a Custom Image in which 2 Docker Containers are made and Apache2 is Installed and Deployed on EC2 Machine where we can push and pull from and in ECR Repository service.

## Architecture

![CUSTOM DOCKER CONTAINER USING EC2 WITH ECR AS REPOSITORY TO PULL_PUSH IMAGES](https://github.com/user-attachments/assets/00c29f76-f248-45a5-b832-93da86d92611)

## Steps

### 1.	Create a IAM Role for EC2

o	Trusted entity type : AWS Service

o	Use case : EC2

o	Next

o	Create

### 2.	Create a Private repository in ECR

o	Repository name : kavit-repository

o	Image tag mutability : Mutable

o	Create

### 3.	Create a EC2 Instance

o	Name : Push_Images_In_ECR 

o	AMI : Amazon linux 2023

o	Instance type : t2.micro

o	Networking settings, Auto Assign : Enable & Tick HTTP

o	Launch Instance

o	Modify IAM Role and Attach the Role created earlier

### 4.	Connect to your instance and do as follows

o	sudo yum update -y

o	sudo yum install docker -y

o	sudo service docker start

o	sudo service docker enable

o	sudo usermod -a -G docker ec2-user

o	docker –version

o	vi CustomDockerfile #Write your Execution Code in here

### 5.	Open a new session of same instance (make sure you keep first session on)

o	docker images

o	docker build -f CustomDockerfile -t kavitkaimage .

### 6.	Go to ECR, Copy the Authentication and paste it in EC2 Instance and also push Image in ECR

o	aws ecr get-login-password --region ap-southeast-1 | docker login –username AWS –password-stdin 851725375246.dkr.ecr.ap-southeast-1.amazonaws.com

o	docker tag kavitkaimage:latest 851725375246.dkr.ecr.ap-southeast-1.amazonaws.com/kavit-repository:latest

o	docker push 851725375246.dkr.ecr.ap-southeast-1.amazonaws.com/kavit-repository:latest

o	docker images

o	Also check in ECR

### 7.	Now For versioning, just change CustomDockerfile

o	vi CustomDockerfile

o	docker build -f CustomDockerfile -t kavitkaimage:v1.1 .

o	docker tag kavitkaimage:v1.1 851725375246.dkr.ecr.ap-southeast-1.amazonaws.com/kavit-repository:latest

o	docker push 851725375246.dkr.ecr.ap-southeast-1.amazonaws.com/kavit-repository:v1.1

o	docker images

o	Also check in ECR

### 8.	Now Remove all images from EC2 Docker Container and pull images from ECR

o	docker rmi -f <image-id>

o	docker pull 851725375246.dkr.ecr.ap-southeast-1.amazonaws.com/kavit-repository:latest

o	docker pull 851725375246.dkr.ecr.ap-southeast-1.amazonaws.com/kavit-repository:v1.1

o	docker images #To check if images are pulled

### 9.	Now to check if it displays the message as intended

o	docker run -t -i -p 80:80 <image-id>

### 10.	Open new session of same instance (make sure old session should be on)

o	docker container inspect <container-id>

o	curl http://172.17.0.2 #For first image

o	curl http://172.17.0.3 #For second image

## Documentation Link

https://docs.google.com/document/d/1a06gEL95djF44YLKctM8THhaLUDU8l4nncltWOQ_kiQ/edit?usp=sharing

## Expected Outcome

After setting up an EC2 instance with Amazon Linux 2023, Docker is installed and configured, with two Docker containers running. Apache2 is installed on the instance and serving content. A custom AMI is created, capturing the state of the EC2 instance, including the Docker containers and Apache2 configuration. This image allows for easy replication of the environment, and Docker images can be pushed and pulled from an ECR repository.
