pipeline {
   agent any

   environment {
     
     SERVICE_NAME = "webapp"
     REPOSITORY_TAG="${YOUR_DOCKERHUB_USERNAME}/devhub-social-organization/${SERVICE_NAME}:${BUILD_ID}"
   }

   stages {
      stage('Preparation') {
         steps {
            git credentialsId: 'GitHub', url: "https://github.com/devhub-social-organization
/${SERVICE_NAME}"
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

      stage('Deploy to Cluster') {
          steps {
            sh 'envsubst < ${WORKSPACE}/deploy.yaml | kubectl apply -f -'
          }
      }
   }
}
