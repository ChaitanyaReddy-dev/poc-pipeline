pipeline {
    agent any

    tools {
        // Install the Maven version configured as "M3" and add it to the path.
        maven "maven"
    }

    stages {
        stage('preparation') {
            steps {
                git 'https://gitlab.com/chaitanyadev/jenkins-demo-app.git'

            }
        }
        stage('build'){
            steps {
            sh 'mvn clean'
            }
        }
        stage('unit testing'){
            steps {
            sh 'mvn test'
        }
        }
        stage('build jar'){
            steps{
                sh 'mvn install'
            }
        }
       
    }
}
