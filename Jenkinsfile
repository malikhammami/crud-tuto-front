pipeline {
    agent any
    parameters {
        string(name: 'BRANCH_NAME', defaultValue: "${scm.branches[0].name}", description: 'Git branch name')
        string(name: 'CHANGE_ID', defaultValue: '', description: 'Git change ID for merge requests')
        string(name: 'CHANGE_TARGET', defaultValue: '', description: 'Git change ID for the target merge requests')
    }
    environment {
        DOCKERHUB_CREDENTIALS = credentials('docker-hub-credentials')
    }
    stages {
        stage('Github') {
            steps {
                script {
                    branchName = params.BRANCH_NAME
                    targetBranch = branchName

                    git branch: branchName,
                    url: 'https://github.com/malikhammami/crud-tuto-front.git'
                   
                }
                echo "Current branch name: ${branchName}"
                echo "Current branch name: ${targetBranch}"
            }
        }

        stage('Build') {
            steps {
                script {
                    // Build the Docker image using the Dockerfile in the current directory
                    sh 'docker build -t malikhammami99/angularachat .'
                }
                echo 'Build Image Completed'
            }
        }
        stage('Login to Docker Hub') {
            steps {
                script {
                    // Login to Docker Hub using credentials
                    sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
                }
                echo 'Login Completed'
            }
        }
        stage('Push Image to Docker Hub') {
            steps {
                script {
                    // Push the built image to Docker Hub
                    sh 'docker push malikhammami99/angularachat'
                }
                echo 'Push Image Completed'
            }
        }
    }

    post {
        always {
            script {
                // Logout from Docker after finishing the pipeline
                sh 'docker logout'
            }
        }
    }
}
