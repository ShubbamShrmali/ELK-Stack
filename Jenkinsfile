stage('Staging') {

  when {
    branch 'staging'
  }

  steps {
    sh 'docker-compose -f docker-compose.yaml up -d'
  }
