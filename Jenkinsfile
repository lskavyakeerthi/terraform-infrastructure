pipeline {
    agent {
        label 'terraform-worker'
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Verify Tools') {
            steps {
                sh '''
                    echo "Running on:"
                    hostname

                    echo "Java version:"
                    java -version

                    echo "Git version:"
                    git --version

                    echo "Terraform version:"
                    terraform version

                    echo "AWS CLI version:"
                    aws --version

                    echo "AWS identity:"
                    aws sts get-caller-identity
                '''
            }
        }
    }
}
