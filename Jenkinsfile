@Library('jenkins_shared_lib') _

pipeline {
    agent any

    parameters{
        choice(name: 'action', choices: 'create\ndelete', description: 'Choose create/destroy')
    }

    stages{
        
        stage('Workspace cleanup'){
            when {expression{parms.action == 'create'}}

            steps{
                cleanWs()
            }
        }

        stage('Git Checkout'){
            when {expression{parms.action == 'create'}}

            steps{
                gitCheckout(
                    branch: "main",
                    url: "https://github.com/nrjydv1997/complete-cicd-java-application.git"
                )
            }
        }

        stage('Unit test maven'){
            when {expression{parms.action == 'create'}}

            steps{
                 mvnTest()
            }
        }

        stage('Maven Integration Test'){
           when {expression{parms.action == 'create'}}

            steps{
                 mvnIntegrationTest()
            }
        }

        stage('Static code analysis'){
            when {expression{parms.action == 'create'}}
            
            steps{
                staticCodeAnalysis()
            }
        }
    }
}
