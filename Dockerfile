FROM ubuntu:14.04

RUN apt-get update && \
  apt-get -y dist-upgrade && \
  apt-get -y install openssh-client curl nvm npm

# Create user "jenkins"
RUN id jenkins 2>/dev/null || useradd --uid 1000 --create-home jenkins

# EOF
