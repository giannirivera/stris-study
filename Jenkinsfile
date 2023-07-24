pipeline {
  agent any

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
        sh 'docker build -t stris--study-app .'

        // Push the Docker image to a container registry (e.g., Azure Container Registry)

        //format is

        //sh 'docker tag my-app <your-container-registry>/my-app:latest'
        //sh 'docker login -u <your-registry-username> -p <your-registry-password> <your-container-registry>'
        //sh 'docker push <your-container-registry>/my-app:latest'

        // Deploy the image to AKS
     
        // format is : sh 'kubectl apply -f deployment.yaml -n <your-kubernetes-namespace>'
        // format is sh 'kubectl set image deployment/<your-deployment-name> <your-container-registry>/my-app:latest -n <your-kubernetes-namespace>'
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
