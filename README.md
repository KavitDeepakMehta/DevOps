# DevOps Setting Up and Deploying an EKS Cluster with Nginx on AWS

## Aim

The objective of this guide is to provide detailed instructions on setting up an Amazon EKS (Elastic Kubernetes Service) cluster, configuring IAM roles, creating and managing node groups, and deploying an Nginx application using Kubernetes YAML files. By the end of this process, you will have a fully operational EKS cluster with an Nginx service accessible via an external IP address.

## Architecture

![KUBERNETES_CLUSTER_ON_AWS](https://github.com/user-attachments/assets/798e580f-62e2-4967-afa3-52572a76bc1a)

## Steps

### 1.	Create EKS IAM Role

•	Use Case: EKS Cluster

•	Permissions: AmazonEKSClusterPolicy

•	Role Name: EKS_ROLE

•	Action: Create the IAM role.

### 2.	Create EC2 IAM Role

•	Use Case: EC2

•	Permissions:

  o	AmazonEC2ContainerRegistryReadOnly
  
  o	AmazonEKS_CNI_Policy
  
  o	AmazonEKSWorkerNodePolicy
  
•	Role Name: EC2-NODE-ROLE

•	Action: Create the IAM role.

### 3.	Create EKS Cluster

•	Cluster Name: EKS_Cluster

•	Assign IAM Role: EKS_ROLE

•	Bootstrap Cluster Administrator Access: Allow Cluster Administrator Access

•	Cluster Authentication Access Mode: EKS API

•	Networking:

  o	Choose the default VPC.
  
  o	Select subnets in ap-southeast-1a and ap-southeast-1b.
  
  o	Use a security group with rules: All traffic, Anywhere IPv4.

•	Cluster IP Address Family: IPv4

•	Cluster Endpoint Access: Public

•	Select Add-ons:

  o	CoreDNS
  
  o	kube-proxy
  
  o	Amazon VPC CNI
  
  o	Amazon EKS POD Identity agent

•	Action: Create the cluster and wait for it to start (this may take several minutes).

### 4.	Create Node Group

•	In the EKS Cluster: Go to the Compute section.

•	Node Group Name: eksnode

•	Node IAM Role: EC2-NODE-ROLE

•	Node Group Compute Configuration:

  o	AMI Type: Amazon Linux 2
  
  o	Capacity Type: On-Demand
  
  o	Instance Type: t3.medium
  
  o	Disk Size: 20 GB
  
•	Node Group Scaling Configuration:

  o	Desired Size: 2
  
  o	Minimum Size: 1
  
  o	Maximum Size: 2
  
•	Node Group Update Configuration:

  o	Maximum Unavailable: 1 node
  
•	Action: Create the node group.

### 5.	Prepare Local Machine (Windows) and Deploy Nginx

•	Save YAML Files:

  o	nginx-deployment.yaml
  
  o	nginx-service.yaml
  
•	File Path: Save these files in C:\Users\admin (or C:\Users\lenovo in your case).

### 6.	Open CMD and Execute Commands:

aws --version

aws configure

curl.exe -O https://s3.us-west-2.amazonaws.com/amazon-eks/1.30.2/2024-07-12/bin/windows/amd64/kubectl.exe

kubectl version --client

aws eks update-kubeconfig --region ap-southeast-1 --name EKS_Cluster

kubectl get nodes

kubectl apply -f nginx-deployment.yaml

kubectl apply -f nginx-service.yaml

kubectl get services nginx-service

### 7.	Access Nginx Service:

•	After running the commands, obtain the external IP of the nginx-service.

•	Copy the external IP and paste it into a new tab in your web browser.

•	Wait for the page to load, as it may take several minutes depending on the load balancer and instance status.

## Documentation Link

[https://docs.google.com/document/d/1a06gEL95djF44YLKctM8THhaLUDU8l4nncltWOQ_kiQ/edit?usp=sharing](https://docs.google.com/document/d/1F9HAGaydu8dotLIOUmcozKueGBkul68WNDuC2P0F7xc/edit?usp=sharing)

## Expected Outcome

By following these steps, you will successfully set up an EKS cluster on AWS with a node group, deploy an Nginx application using Kubernetes, and access the service via an external IP address in your web browser. The Nginx welcome page should be displayed, confirming that your deployment is successful and the service is operational.
