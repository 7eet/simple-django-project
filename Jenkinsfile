pipeline {
    agent any

    stages {
        stage('Clone Repository') {
            steps {
                sh '''#!/bin/bash
                    echo "Clone Stage Started >>>"
                    rm -rf $(pwd)/temp-proj
                    mkdir $(pwd)/temp-proj
                    cd $(pwd)/temp-proj
                    git clone https://github.com/7eet/simple-django-project.git
                    echo "Clone Stage Ended <<<"
                    
                '''
            }
        }

        stage('Test') {
            steps {
                sh '''
                    #!/bin/bash
                    cd $(pwd)/temp-proj/simple-django-project
                    echo "Test Stage Started >>>"
                    chmod +x ./runDockerTestImage.sh
                    ./runDockerTestImage.sh
                '''
                
                 withCredentials([usernamePassword(credentialsId: 'docker-credentials', passwordVariable: 'dockerPassword', usernameVariable: 'dockerID')]) {
                    sh '''
                    sudo docker login --username $dockerID --password $dockerPassword
                    sudo docker push 7eet/production-project:latest
                    echo "Test Stage Ended <<<"
                    '''
                }
            }
        }

        stage('Deploy') {
            steps {
                sh '''
                    #!/bin/bash
                    echo "Locally Running Stage Started >>>"
                    sudo docker pull 7eet/production-project:latest
                    sudo docker run -d -p 8000:8000 7eet/production-project
                    sudo docker logout 
                    echo "Local Running Ended <<<"
                '''
            }
        }
    }
}

// deploy script to heroku (user should logged in using CLI before using it)
// sudo docker login --username=_ --password=$(heroku auth:token) registry.heroku.com
// sudo heroku container:login
// sudo docker tag 7eet/production-project:latest registry.heroku.com/first-apppractice/web 
// sudo docker push registry.heroku.com/first-apppractice/web
// sudo heroku container:release --app first-apppractice web
