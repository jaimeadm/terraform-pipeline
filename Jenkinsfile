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
                sh 'terraform version'
            }
        }
        stage('Terraform init') {
            steps {
                sh 'terraform init'
                sh 'export TF_VAR_aws_access_key=${AWS_ACCESS_KEY}'
                sh 'export TF_VAR_aws_secret_key=${AWS_SECRET_KEY}'
            }
        }
        stage('Terraform plan') {
            steps {
                sh "terraform plan -out=plan.out"
            }
        }
        stage('Terraform apply') {
            steps {
                sh "terraform apply -auto-approve"
            }
        }
        stage('Terraform destroy') {
            steps {
                // Create an Approval Button with a timeout of 5 minutes.
                timeout(time: 5, unit: "MINUTES") {
                    input message: 'Do you want to run terraform destroy command?', ok: 'Yes'
                }
                echo "Destroying Resources"
                sh 'terraform destroy -auto-approve'
            }
        }
    }
}
