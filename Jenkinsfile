pipeline {
    agent {
        docker {
            image 'python'
            args '--network=zepalheta-network'
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
        stage('Testes de API') {
            steps {
                sh 'robot -d ./logs tests/api/sessions'
             }
        }  
    }     
    post {
        always {
             robot 'logs'  
        }
    }     

}

