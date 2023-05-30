@Library('jenkins_shared_lib') _

pipeline {
    agent any

    parameters{
        choice(name: 'action', choices: 'create\ndelete', description: 'Choose create/destroy')
        string(name: 'hubUser', description: "name of the docker build", defaultValue: 'nrjydv1997')
        string(name: 'ImageTag', description: "name of the docker image", defaultValue: '${BUILD_NUMBER}')
        string(name: 'projectName', description: "name of the application", defaultValue: 'complete-cicd-java-application')
    }

    stages{
        
        stage('Workspace cleanup'){
          when {expression{params.action == 'create'}}

            steps{
                cleanWs()
            }
        }

        stage('Git Checkout'){
            when {expression{params.action == 'create'}}

            steps{
                gitCheckout(
                    branch: "main",
                    url: "https://github.com/nrjydv1997/complete-cicd-java-application.git"
                )
            }
        }

        stage('Unit test maven'){
         when {expression{params.action == 'create'}}

            steps{
                 //mvnTest()
                 sh 'echo maven test stage'
            }
        }

        stage('Maven Integration Test'){
         when {expression{params.action == 'create'}}

            steps{
                // mvnIntegrationTest()
                 sh 'echo mvnIntegrationTest stage'
            }
        }

        stage('Static code analysis'){
          when {expression{params.action == 'create'}} 
            steps{
                script{
                    def SonarQubeCredentialsId = 'sonar-api'
                    staticCodeAnalysis(SonarQubeCredentialsId)
                
                }
            }
        }

        stage('Quality Gate Status'){
          when {expression{params.action == 'create'}} 
            steps{
                script{
                    def SonarQubeCredentialsId = 'sonar-api'
                    qualityGateStatus(SonarQubeCredentialsId)
                
                }
            }
        }

        stage('Maven Build'){
          when {expression{params.action == 'create'}} 
            steps{
                script{
                   // mvnBuild()
                   sh 'echo mvnIntegrationTest stage'
                }
            }
        }

        stage('Docker Image Build'){
          when {expression{params.action == 'create'}} 
            steps{
                script{
                    dockerBuild("${params.hubUser}","${projectName}","${ImageTag}")
                }
            }
        }
    }
}
