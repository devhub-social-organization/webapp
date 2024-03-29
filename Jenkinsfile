pipeline {
   agent any

   environment {
     SERVICE_NAME = "webapp"
     REPOSITORY_TAG="${YOUR_DOCKERHUB_USERNAME}/${SERVICE_NAME}"
     registry = "steven8519/webapp"
     registryCredential = 'docker_hub'
     dockerImage = ''
   }

   stages {
      stage('Preparation') {
         steps {
            git credentialsId: 'GitHub', url: "https://github.com/devhub-social-organization/${SERVICE_NAME}"
         }
      }
      stage('Build') {
         steps {
            sh 'echo No build required for Webapp.'
         }
      }

      stage('Build docker image') {
         steps {
           sh 'docker image build -t ${REPOSITORY_TAG} .'
         }
      }

      stage('Deploy Image') {
        steps{
          script {
            docker.withRegistry( '', registryCredential ) {
            sh 'docker push steven8519/webapp'
            }
          }
        }
      }

      stage('Deploy to Cluster') {
          steps {
            sh 'kubectl apply -f deploy.yaml'
          }
      }
   }
}
