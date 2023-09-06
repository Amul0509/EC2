#jenkins pipeline script
pipeline {
    
    environment {
        SECRET_VALUE = credentials('awskeys')
    }
    
    agent any

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', credentialsId: 'github_cred', url: 'https://github.com/Amul0509/EC2.git'
            }
        }
        stage('Terraform init') {
            steps {
                
                sh 'terraform init'
            
            }
        }
        stage('Terraform plan') {
            steps {
                sh 'terraform plan'
            }
        }
        stage('Terraform apply') {
            steps {
                
                sh 'terraform apply --auto-approve'
            }
        }
        
    }
}    