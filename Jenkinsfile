pipeline {
    environment {
            registry = "vinodlaggere/abc2"
            registryCredential = 'B7-dockerhub'
            dockerImage = ''
            }
    agent any
     tools{
          maven 'm395'
        }
        stages {
            stage('Cloning our Git') {
            steps {
                git 'https://github.com/Vinod-Laggere/java-maven-app.git'
            }

            stage('build target') {
			steps{
				    sh 'mvn install'
			     
			}
            }
            stage('Building our image') {
                steps{
                 script {
                    dockerImage = docker.build registry + ":$BUILD_NUMBER"
            }
            }
            }
            stage('Deploy our image') {
            steps{
                script {
                docker.withRegistry( '', registryCredential ) {
            dockerImage.push()
            }
            }
            }
            }
            stage('Cleaning up') {
            steps{
            sh "docker rmi $registry:$BUILD_NUMBER"
            }
            }
    }
}
