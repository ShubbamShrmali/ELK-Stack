pipeline {
    agent any
 tools {
  terraform 'Terraform'
}

    stages {
        stage('Git checkout') {
           steps{
                git branch: 'main', credentialsId: 'Github', url: 'https://github.com/ShubbamShrmali/ELK-Stack.git'
            }
        }
        stage('terraform init') {
            steps{
                sh 'terraform init'
            }
        }
        stage('terraform apply') {
            steps{
                sh 'terraform apply --auto-approve'
            }
        }
    }

    
}
