pipeline {
  agent any
  stages {
    stage('Build Docker Image') {
      steps {
         sh 'docker build -t buildapp/spam-detector .'
      }
    }
    stage('Push to Docker Hub') {
      steps {
        withCredentials([usernamePassword(credentialsId: 'dockerhubcred', passwordVariable: 'dockerHubPassword', usernameVariable: 'dockerHubUser')]) {
          sh "docker login -u ${env.dockerHubUser} -p ${env.dockerHubPassword}"
          sh 'docker push buildapp/spam-detector'
         }
      }
    }
   stage('Deploy to Kubernetes Cluster'){
      steps{
        dir('./Documents/SMS-Message-Spam-Detector') {
            script{
                sh 'kubectl apply -f kubernetes.yaml'
                sh 'kubectl get all'
           }
        }
     }
   }
  }
}
