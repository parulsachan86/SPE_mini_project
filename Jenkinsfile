pipeline{
    environment{
        DOCKERHUB_CREDENTIALS = credentials('jenkins_dockerhub')
	}
    agent any
    stages{
        stage("Git clone"){
            steps{
               git branch: 'master', url: 'https://github.com/parulsachan86/SPE_mini_project.git'
            }
        }
        stage('Maven Build'){
            steps{
                echo 'Job Build'
                sh "mvn clean install"
            }
        }
        stage("Building our Image"){
            steps{
                script{
                    echo "Building dockerimage"
                    // dockerImage = docker.build("parul/scientific_calculator:latest")
                    sh 'docker build -t parulsachan86/scientific_calc .'
                }
            }
        }
        stage('Login into DockerHub and pushing the image parul/scientific_calc') {
              steps {
                sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin';

              }
            }
        stage('Pushing the image to dockehub'){
            steps{
                 sh 'docker push parulsachan86/scientific_calc:latest'
            }
        }        // stage("Pushing the image to dockerhub"){
        //     steps{
        //         script{
        //             // sh 'echo $'
        //             // sh "docker login -u parulsachan86 -p ${dockerhub}"
        //             // sh "docker push parul/scientific_calc"

        //         }
        //     }
        // }
        stage('Deleting the docker image from loacl host'){
            steps{
                sh 'docker rmi parulsachan86/scientific_calc'
            }
        }
        stage('Ansible deploy'){
            steps{
//                 sh 'ansible-playbook -i inv_aman_laptop playbook.yml'
             sh 'ansible-playbook -i inventoryfile playbook.yml'
//                 sh 'ansible-playbook -i inventory playbook.yml'
                // sh 'ansible-playbook ping.yml'
            }
        }
    }
}