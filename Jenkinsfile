pipeline {
    agent any

    parameters {
        choice(name: 'action', choices: ['apply', 'destroy'], description: 'What action should Terraform take?')
    }

    environment {
        AWS_ACCESS_KEY_ID = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
    }

    stages {
        stage('List Directory') {
            steps {
                sh 'ls **'
            }
        }
        stage('Terraform') {
            steps {
                script {
                        dir('terraform') {
                            sh 'terraform init'
                            sh 'terraform validate'
                            sh "terraform ${params.action} -auto-approve"
                            if (params.action == 'apply') {
                            sleep(time:10,unit:"SECONDS")
                            }
                            }
                        }
                }
        }
    }
}