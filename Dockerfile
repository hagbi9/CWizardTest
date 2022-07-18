FROM jenkins/jenkins:2.60.3

LABEL maintainer="liorhagbi@gmail.com"
#COPY plugins_extra.txt /usr/share/jenkins/ref/plugins_extra.txt
COPY --chown=jenkins:jenkins plugins_extra.txt /usr/share/jenkins/ref/plugins_extra.txt

ENV JENKINS_HOME /var/jenkins_home

ARG JAVA_OPTS
ENV JAVA_OPTS "-Djenkins.install.runSetupWizard=false ${JAVA_OPTS:-}"

# RUN xargs /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins_extra.txt
# RUN jenkins-plugin-cli --clean-download-directory --list --view-security-warnings -f /usr/share/jenkins/ref/plugins_extra.txt
RUN jenkins-plugin-cli -f /usr/share/jenkins/ref/plugins_extra.txt
