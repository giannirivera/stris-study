# Use the official Jenkins agent base image
FROM jenkins/agent:4.10-4-jdk11

# Switch to the root user to install Docker
USER root

# Install Docker inside the Jenkins agent container
RUN apt-get update && apt-get install -y docker.io
RUN curl -fsSL https://deb.nodesource.com/setup_lts.x | bash -
RUN apt-get install -y nodejs

# Switch back to the Jenkins user
USER jenkins

# Define the Jenkins agent label
LABEL jenkins-agent