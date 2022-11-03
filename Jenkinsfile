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
        sh 'docker compose -f docker-compose.yaml up'
        
    stage('Run tests against the container') {
      steps {
        sh 'curl http://ec2-44-202-92-2.compute-1.amazonaws.com:9200'
      }
    }
      }
    }
    
  }
 
}
