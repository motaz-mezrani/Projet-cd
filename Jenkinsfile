pipeline {

  tools {nodejs "NodeJs"}
	agent any 
  
	stages {
		
		stage('Git ') {
            steps {
                echo 'pulling Main Project from git ...';
                git branch: 'main', credentialsId: '986aaff5-fe2c-4d18-aa3d-8849a343e52b', url: 'https://github.com/motaz-mezrani/Projet-cd.git'            }
        }
    
    stage('Docker Login') {
            steps {
                withDockerRegistry([credentialsId: "docker-hub", url: ""]) {
                sh 'echo "docker logged in "'
                                            }
                         }
        }    


    stage('Build') {
            steps {
                sh 'npm install'
                sh 'ansible-playbook Ansible/build.yml -i Ansible/inventory/hosts.yml'
                         }
        }
    
    stage('Docker create container and image') {
            steps {
                sh 'ansible-playbook Ansible/docker.yml -i Ansible/inventory/hosts.yml'
                         }
        }
    
    
    stage('Docker-Registry') {
            steps {
                sh 'ansible-playbook Ansible/docker-registry.yml -i Ansible/inventory/hosts.yml'
                         }
        }
    

	 
	}
	}
