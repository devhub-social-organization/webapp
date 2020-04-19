pipeline {
   agent any

   environment {
     
     SERVICE_NAME = "webapp"
     REPOSITORY_TAG="${YOUR_DOCKERHUB_USERNAME}/${SERVICE_NAME}"
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

      stage('Push Image') {
         steps {
            sh 'docker push steven8519/webapp'
         }
      }

      stage('Deploy to Cluster') {
          steps {
            kubernetesDeploy(
               configs: 'deploy.yaml',
               kubeconfigId: 'KUBERNATES_CONFIG',
               enableConfigSubstitution: true
            )
          }
      }
   }
}
