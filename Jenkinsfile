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
        sh 'ansible-playbook deployment-playbook.yml'
     }
   }
  }
}
