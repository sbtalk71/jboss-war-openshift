FROM registry.redhat.io/jboss-eap-7/eap74-openjdk17-openshift-rhel8:7.4.21-6

# Copy war to deployments folder
COPY Test.war $JBOSS_HOME/standalone/deployments/

# User root to modify war owners
USER root

# Modify owners war
RUN chown jboss:jboss $JBOSS_HOME/standalone/deployments/Test.war

# Important, use jboss user to run image
USER jboss