pipeline {
    agent {
        label 'terraform-worker'
    }

    parameters {
        string(
            name: 'SSH_ALLOWED_CIDR',
            defaultValue: '',
            description: 'Your public IP with /32, for example 49.37.10.20/32'
        )
        string(
            name: 'AWS_KEY_NAME',
            defaultValue: 'aug-ubu-pem',
            description: 'Existing EC2 key-pair name in ap-south-1'
        )
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Terraform Init') {
            steps {
                dir('terraform') {
                    sh 'terraform init -migrate-state -force-copy'
                }
            }
        }

        stage('Terraform Validate') {
            steps {
                dir('terraform') {
                    sh 'terraform validate'
                }
            }
        }

        stage('Terraform Plan') {
            steps {
                dir('terraform') {
                    sh '''
                        test -n "${SSH_ALLOWED_CIDR}" || {
                            echo "SSH_ALLOWED_CIDR is required. Use Build with Parameters."
                            exit 1
                        }
                        terraform plan \
                            -var="ssh_allowed_cidr=${SSH_ALLOWED_CIDR}" \
                            -var="key_name=${AWS_KEY_NAME}"
                    '''
                }
            }
        }

        stage('Terraform Apply') {
            steps {
                dir('terraform') {
                    sh '''
                        terraform apply -auto-approve \
                            -var="ssh_allowed_cidr=${SSH_ALLOWED_CIDR}" \
                            -var="key_name=${AWS_KEY_NAME}"
                    '''
                }
            }
        }
    }

    post {
        success {
            echo 'Terraform deployment completed successfully.'
        }

        failure {
            echo 'Terraform deployment failed.'
        }
    }
}
