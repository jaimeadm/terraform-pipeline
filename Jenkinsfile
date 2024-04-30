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
                git branch: 'master', credentialsId: 'github_login_jaimeadm', url: 'https://github.com/jaimeadm/terraform-pipeline'
            }
        }
        stage('Credentials') {
            steps {
                sh 'export AWS_REGION=$(AWS_REGION)'
                sh 'export AWS_ACCESS_KEY_ID=${AWS_ACCESS_KEY}'
                sh 'export AWS_SECRET_ACCESS_KEY=${AWS_SECRET_KEY}'
            }
        }
        stage('Terraform init') {
            steps {
                sh 'terraform init'
            }
        }
        stage('Terraform fmt') {
            steps {
                sh 'terraform fmt -recursive'
            }
        }
        stage('Terraform validate') {
            steps {
                sh 'terraform validate'
            }
        }
        stage('Terraform plan') {
            steps {
                sh 'terraform plan -out=plan.out'
            }
        }
        stage('Terraform apply') {
            steps {
                sh 'terraform apply -auto-approve plan.out'
            }
        }
        stage('Terraform destroy') {
            steps {
                // Create an Approval Button with a timeout of 5 minutes.
                timeout(time: 5, unit: "MINUTES") {
                    input message: 'Do you want to run terraform destroy command?', ok: 'Yes'
                }
                echo 'Destroying Resources'
                sh 'terraform destroy -auto-approve'
            }
        }
    }
}
