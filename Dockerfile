FROM jenkins/jenkins:lts-jdk11

LABEL maintainer="liorhagbi@gmail.com"
#COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
COPY --chown=jenkins:jenkins plugins.txt /usr/share/jenkins/ref/plugins.txt

ENV JENKINS_HOME /var/jenkins_home

ARG JAVA_OPTS
ENV JAVA_OPTS "-Djenkins.install.runSetupWizard=false ${JAVA_OPTS:-}"

# RUN xargs /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt
# RUN jenkins-plugin-cli --clean-download-directory --list --view-security-warnings -f /usr/share/jenkins/ref/plugins_extra.txt
RUN jenkins-plugin-cli -f /usr/share/jenkins/ref/plugins.txt
