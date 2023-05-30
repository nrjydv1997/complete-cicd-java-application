@Library('jenkins_shared_lib') _

pipeline {
    agent any

    stages{

        stage('Workspace cleanup'){
            steps{
                cleanWs()
            }
        }

        stage('Git Checkout'){
            steps{
                gitCheckout(
                    branch: "main",
                    url: "https://github.com/nrjydv1997/complete-cicd-java-application.git"
                )
            }
        }

        stage('Unit test maven'){
            steps{
                 mvnTest()
            }
        }

        stage('Maven Integration Test'){
            steps{
                 mvnIntegrationTest()
            }
        }
    }
}
