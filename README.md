# SMS-Message-Spam-Detector
Jenkins CI/CD Pipeline to deploy a simple flask app to detect spam or ham onto Kubernetes Cluster

## **Design**
   * Created two VMs as a master and client machine <br>
   * Develop an app and create a respective requirement.txt file to install all required dependencies for this python flask app <br>
   * Created a Dockerfile which builds a docker image and pushed the docker image to DockerHub <br>
   * Created a kubernetes.yml file which will pull the docker image from dockerhub and create three running replicas <br>
       * “kubectl apply -f kubernetes.yml” command to launch the deployment and service of the application 
   * Make sure Kubernetes Cluster runs successfully using the following useful commands 
       * kubectl get services 
       * minikube service “service-name” <br>
   *  

