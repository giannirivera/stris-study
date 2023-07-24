pipeline {
  agent  {
    docker {
            // Specify the Docker image to use for the Jenkins agent
            label 'jenkins-agent'
            image 'my-custom-jenkins-agent:latest' // Replace with your custom image or use 'node:14' for a Node.js image
            args '-v /var/run/docker.sock:/var/run/docker.sock' // Mount Docker socket for Docker-in-Docker support
        }
  }

  stages {
    stage('Checkout') {
      steps {
        // Clone your Git repository to Jenkins workspace
        checkout scm
      }
    }

    stage('Install Dependencies') {
      steps {
        // Install Node.js and npm (if not already installed)
        // Make sure you have Node.js and npm on the Jenkins build agent
        // You can also use a Node.js Docker image as the build agent.
        // Install Node.js and npm before running the build process.
        sh 'npm install'
      }
    }

    stage('Build') {
      steps {
        // Build the React app
        sh 'npm run build'
      }
    }

    stage('Run Tests') {
      steps {
        // Run your tests here (if you have any)
        // For example, you can use a testing framework like Jest for React tests.
        // Replace the following command with your actual test command.
        sh 'npm test'
      }
    }

    stage('Deploy') {
      steps {
        // Build the Docker image
        script {
          docker.build("docker.io/giannirivera/giannirivera/myapp:latest")
        }

        // Log in to Docker Hub
        withCredentials([usernamePassword(credentialsId: 'docker-hub-credentials', passwordVariable: 'DOCKERHUB_PASSWORD', usernameVariable: 'DOCKERHUB_USERNAME')]) {
                    sh 'docker login -u $DOCKERHUB_USERNAME -p $DOCKERHUB_PASSWORD'
        }
        // Push the Docker image to Docker Hub
        sh 'docker push docker.io/giannirivera/giannirivera/myapp:latest'
      }
    }
  }

  post {
    always {
      // Clean up any temporary or unnecessary files
      sh 'npm prune --production'
    }
    success {
      // Run this block if the pipeline is successful
      echo 'Build successful!'
    }
    failure {
      // Run this block if the pipeline fails
      echo 'Build failed!'
    }
  }
}
