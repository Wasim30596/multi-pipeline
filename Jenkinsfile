pipeline {
    agent any

    environment {
        TF_WORKDIR = "environments/${env.BRANCH_NAME}"
    }

    stages {

        stage('checkout') {
            steps {
                checkout scm
            }
        }

        stage('terraform init') {
            steps {
                dir("${TF_WORKDIR}") {
                    sh 'terraform init'
                }           // ← closes dir()
            }               // ← closes steps
        }                   // ← closes stage

        stage('terraform plan') {
            steps {
                dir("${TF_WORKDIR}") {
                    sh 'terraform plan -out=tfplan'
                    sh 'terraform show -no-color tfplan > plan.txt'
                    sh 'cat plan.txt'
                }           // ← closes dir()
            }               // ← closes steps
        }                   // ← closes stage

        stage('Approval') {
            steps {
                input message: "Approve the deployment to production?", ok: 'Deploy'
            }
        }

        stage('terraform apply') {
            steps {
                dir("${TF_WORKDIR}") {
                    sh 'terraform apply -auto-approve'
                }           // ← closes dir()
            }               // ← closes steps
        }                   // ← closes stage

    }       // ← closes stages
}           // ← closes pipeline