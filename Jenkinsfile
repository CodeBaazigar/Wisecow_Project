pipeline {
    agent any

    stages {
        stage(' Git Chekout ') {
            steps {
                git branch: 'main', credentialsId: 'Github_Cred', url: 'https://github.com/CodeBaazigar/Wisecow_Project.git'
            }
        }
        stage(' Build Docker Image') {
            steps {
                sh 'docker build -t codebaazigar/wisecow:latest .'
            }
        }
        stage(' Pushing to Dockerhub ') {
            steps {
                withDockerRegistry(credentialsId: 'Dockerhub_Cred', url: 'https://index.docker.io/v1/') {
                  sh  'docker push codebaazigar/wisecow:latest'
                }
            }
        }
        stage('Deploying to k8s Node') {
            steps {
                kubernetesDeploy (configs: 'Kubernetesfile.yml', kubeconfigId: 'Kubernetes_Config')
            }
        }
    }
}

