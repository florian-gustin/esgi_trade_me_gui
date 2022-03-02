node {
  stage('SCM') {
    checkout scm
  }
  stage('Build'){
  }
  stage('Tests'){
  }
  stage('SonarQube Analysis') {
    def scannerHome = tool 'sonarqube';
    withSonarQubeEnv() {
      sh "${scannerHome}/bin/sonar-scanner"
    }
  }
  stage('Quality Gate'){
  }
  stage('Deploy'){
  }
}