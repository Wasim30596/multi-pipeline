pipeline{
    agent any{

        environment{
            TF_WORKDIR = "environments/${env.BRANCH_NAME}"
        }

        stages{

            stage ('checkout'){
                steps{
                    checkout scm
                }
            }
            stage ('terraform init'){
                steps{
                    dir("${TF_WORKDIR}") {
                    sh 'terraform init'
                }

            }

            stage ('terraform plan'){
                steps{
                    dir("${TF_WORKDIR}") {
                    sh 'terraform plan -out=tfplan'     
                    sh 'terraform show -no-color tfplan > plan.txt'
                    sh 'cat plan.txt'

                }
            }
            stage('Approval')   {

        //    when {
        //         expression { env.BRANCH_NAME == 'production' }
        //     }     
            steps {
                 input message: "Approvee the deployment to production?", ok: 'Deploy'
            }
        }   


             stage ('terraform apply'){
                steps{
                    dir("${TF_WORKDIR}") {
                    sh 'terraform apply -auto-approve'
                }
            }
        }
    }
}