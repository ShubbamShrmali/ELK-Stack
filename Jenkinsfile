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
        sh 'docker-compose up'
      }
    }
        
    stage('elasticsearch') {
      steps {
        sh 'curl http://ec2-44-202-92-2.compute-1.amazonaws.com:9200'
      }
    }
    stage('kibana') {
      steps {
        sh 'curl http://ec2-44-202-92-2.compute-1.amazonaws.com:5601'
      }
    }
    stage('logtash') {
      steps {
        sh 'curl http://ec2-44-202-92-2.compute-1.amazonaws.com:9600'
    
  }
 
}
  }
}
