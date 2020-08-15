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
			echo 'cleaning target directory'
            sh 'mvn clean'
            }
        }
        stage('unit testing'){
            steps {
			echo 'performing unit testing'
            sh 'mvn test'
        }
        }
        stage('build jar'){
            steps{
				echo 'building jar'
                sh 'mvn install'
            }
        }
		stage('build docker image'){
			steps{
			 sh '''#!/bin/bash
			  echo 'inside bash'
			  echo 'building docker image'
			  cd /var/lib/jenkins/workspace/poc-pipeline
			  cp /var/lib/jenkins/workspace/poc-pipeline/target/demo-0.0.1-SNAPSHOT.jar /var/lib/jenkins/workspace/poc-pipeline
			  sudo -S docker build -t pipeline .
			 '''
			}
		}
		stage('Run dokcer image'){
			steps{
			sh '''#!/bin/bash
			echo 'running docker image'
		    sudo docker run -p 8090:8085 pipeline
			echo 'application deployed'
			'''
			}
		}
    }
}
