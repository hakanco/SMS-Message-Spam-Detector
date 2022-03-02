# SMS-Message-Spam-Detector
Jenkins CI/CD Pipeline to deploy a simple flask app to detect spam or ham onto Kubernetes Cluster

## **Design**
   * Created two VMs as a master and client machine <br>
   * Develop an app and create a respective requirement.txt file to install all required dependencies for this python flask app <br>
   * Created a Dockerfile which builds a docker image and pushed the docker image to DockerHub <br>
   * Created a kubernetes.yml file which will pull the docker image from dockerhub and create three running replicas <br>
       * “kubectl apply -f kubernetes.yml” command to launch the deployment and service of the application 
   * Made sure Kubernetes Cluster runs successfully using the following useful commands 
       * kubectl get services 
       * minikube service “service-name” <br>
   * Started Jenkins locally on the master machine
       * Configured Jenkins and credentials
       * Installed required plugins
   * Created Jenkinsfile (The pipeline operates the following steps):
       * Pulls the code from GitHub
       * Clones the repository
       * Builds a Docker Image
       * Pushes the image to DockerHub repository
       * Deploys the application to Kubernetes Cluster
   * Installed kind (Kubernetes in Docker) (which is a tool runnning local kubernetes clusters using Docker Container nodes) using the following commands
       * sudo curl -L "https://kind.sigs.k8s.io/dl/v0.8.1/kind-$(uname)-amd64" -o /usr/local/bin/kind
       * sudo chmod +x /usr/local/bin/kind
       * kind get clusters
   
   
   ## **Design on LucidChart**
   ![LucidChart](https://user-images.githubusercontent.com/56145174/156444108-f9520ce8-970f-47e0-bbf5-f8c3057b3c75.png)

      

