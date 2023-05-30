@Library('jenkins_shared_lib') _

pipeline {
    agent any

    parameters{
        choice(name: 'action', choices: 'create\ndelete', description: 'Choose create/destroy')
    }

    stages{
        
        stage('Workspace cleanup'){
            when {expression{parm.action == 'create'}}

            steps{
                cleanWs()
            }
        }

        stage('Git Checkout'){
            when {expression{parm.action == 'create'}}

            steps{
                gitCheckout(
                    branch: "main",
                    url: "https://github.com/nrjydv1997/complete-cicd-java-application.git"
                )
            }
        }

        stage('Unit test maven'){
            when {expression{parm.action == 'create'}}

            steps{
                 mvnTest()
            }
        }

        stage('Maven Integration Test'){
            when {expression{parm.action == 'create'}}

            steps{
                 mvnIntegrationTest()
            }
        }

        stage('Static code analysis'){
            when {expression{parm.action == 'create'}}
            
            steps{
                staticCodeAnalysis()
            }
        }

        stage('Static code analysis'){
            when {expression{parm.action == 'create'}}
            
            steps{
                staticCodeAnalysis()
            }
        }
    }
}
