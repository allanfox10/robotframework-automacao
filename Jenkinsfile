pipeline {
    agent {
        docker {
            image 'python'
        }
    }    

    stages {
        stage('Build') {
            steps {
                sh 'pip install -r requirements.txt'
                  }
        }
        stage('Testes de API') {
            steps {
            sh 'robot -d ./logs tests/api/customers'
            }
        }    
    }
}