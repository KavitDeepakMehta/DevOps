aws --version
aws configure
curl.exe -O https://s3.us-west-2.amazonaws.com/amazon-eks/1.30.2/2024-07-12/bin/windows/amd64/kubectl.exe
kubectl version --client
aws eks update-kubeconfig --region ap-southeast-1 --name EKS_Cluster
kubectl get nodes
kubectl apply -f nginx-deployment.yaml
kubectl apply -f nginx-service.yaml
kubectl get services nginx-service