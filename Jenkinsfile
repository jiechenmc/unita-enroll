pipeline {
    agent any

    parameters {
        choice(name: 'action', choices: ['apply', 'destroy'], description: 'What action should Terraform take?')
        string(name: 'clinc', defaultValue: '', description: "What is the name of the clinc enrolling?")
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
                        sh 'terraform init'
                        sh 'terraform validate'
                        sh "terraform ${params.action} -auto-approve -var=\"clinc_name=${params.clinc}\""
                    }
                }
        }
    }
}