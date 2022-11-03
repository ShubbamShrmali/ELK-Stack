pipeline {
  agent any
  stages {
    stage("verify tooling") {
      steps {
        sh '''
          docker version
          docker info
          docker-compose --version 
          curl --version
        '''
      }
  
    }
    stage('Start container') {
      steps {
         'docker-compose -f 'docker-compose.yaml' up'
      }
    }
        
 
}
  }

