pipeline {
   agent any

   environment {
     
     SERVICE_NAME = "webapp"
     REPOSITORY_TAG="${YOUR_DOCKERHUB_USERNAME}/devhub-social-organization-${SERVICE_NAME}:${BUILD_ID}"
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

      stage('Build and Push Image') {
         steps {
           sh 'docker image build -t ${REPOSITORY_TAG} .'
         }
      }

      stage('Build and Push Image') {
         steps {
           withCredentials([string(credentialsId: 'Docker_Hub_ID', variable: 'Docker_Hub_ID')]) {
           sh "docker login -u steven8519 -p ${Docker_Hub_ID}"
         }
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
