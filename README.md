# SMS-Message-Spam-Detector
Jenkins CI/CD Pipeline to deploy a simple flask app to detect spam or ham onto Kubernetes Cluster

## Design
 1 - Created two VMs as a master and client machine <br>
 2 - Develop an app and create a respective requirement.txt file to install all required dependencies for this python flask app <br>
 3 - Created a Dockerfile which builds a docker image and pushed the docker image to DockerHub <br>
 4 - Created a kubernetes.yml file which will pull the docker image from dockerhub and create three running replicas 
       - “kubectl apply -f kubernetes.yml” command to launch the deployment and service of the application <br>
 5 - 

