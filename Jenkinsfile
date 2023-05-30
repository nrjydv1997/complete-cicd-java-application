@Library('jenkins_shared_lib') _

pipeline {
    agent any

    parameters{
        choice(name: 'action', choices: 'create\ndelete', description: 'Choose create/destroy')
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
                 mvnTest()
            }
        }

        stage('Maven Integration Test'){
         when {expression{params.action == 'create'}}

            steps{
                 mvnIntegrationTest()
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
    }
}
