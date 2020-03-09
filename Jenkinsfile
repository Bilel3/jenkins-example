pipeline {
   agent any

   tools {
      maven "maven"
   }

   stages {
      stage('Build') {
         steps {
            // Get some code from a GitHub repository
            git 'https://github.com/Bilel3/jenkins-example.git'
            
            //sh 'mvn clean verify sonar:sonar'

            // Run Maven on a Unix agent.
            sh "mvn -Dmaven.test.failure.ignore=true clean package"

            // To run Maven on a Windows agent, use
            // bat "mvn -Dmaven.test.failure.ignore=true clean package"
            
            //run tests (clean package execute les test automatiquemant
            //sh 'mvn test'
            
         }

         post {
            // If Maven was able to run the tests, even if some of the test
            // failed, record the test results and archive the jar file.
            success {
               junit '**/target/surefire-reports/TEST-*.xml'
               archiveArtifacts 'target/*.jar'
               sh 'mvn clean deploy -x'
            }
            
         }
      }
   }
}
