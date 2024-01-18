pipeline {
    agent any

    environment {
        AWS_REGION="us-east-1"
        AWS_ACCESS_KEY= credentials('aws-access-key')
        AWS_SECRET_KEY= credentials('aws-secret-key') 
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'master', credentialsId: 'github_login_jaimeadm', url: 'https://github.com/jaimeadm/terraform-test'
            }
        }
        stage('Terraform version') {
            steps {
                sh 'terraform --version'
            }
        }
        stage('Terraform init') {
            steps {
                sh 'terraform init'
            }
        }
        stage('Terraform plan') {
            steps {
                sh "terraform plan -out=tfplan.out -var aws_access_key=${AWS_ACCESS_KEY} -var aws_secret_key=${AWS_SECRET_KEY}"
            }
        }
        stage('Terraform apply') {
            steps {
                sh "terraform apply -auto-approve -var aws_access_key=${AWS_ACCESS_KEY} -var aws_secret_key=${AWS_SECRET_KEY}"
            }
        }
    }
}
