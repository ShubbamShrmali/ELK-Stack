pipeline {
    agent any
 tools {
  terraform 'Terraform'
}

    stages {
        stage('Git checkout') {
           steps{
                git branch: 'main', credentialsId: 'GitHub', url: 'https://github.com/ShubbamShrmali/ELK-Stack.git'
            }
        }
        stage('terraform format check') {
            steps{
                sh 'terraform fmt'
            }
        }
        stage('terraform Init') {
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
