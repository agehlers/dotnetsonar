FROM dotnet-20-rhel7:latest

EXPOSE 8080

ENV PATH=$HOME/.local/bin/:$PATH \
    LC_ALL=en_US.UTF-8 \
    LANG=en_US.UTF-8
   
ENV SUMMARY="Jenkins slave with chrome and firefox installed for use with functional/BDD tests that use BDDStack." \
    DESCRIPTION=""

LABEL summary="$SUMMARY" \
      description="$DESCRIPTION" \
      io.k8s.description="$DESCRIPTION" \
      io.k8s.display-name="Jenkins-Pipeline-SonarScanner-dotnet" \
      io.openshift.expose-services="8080:http" \
      io.openshift.tags="builder,jenkins-jnlp-chrome,jenkins-jnlp-firefox,jenkins-jnlp" \
      release="1"

USER 0

# Install Mono, Java JDK 8

RUN pushd /opt \
    && yum install yum-utils \
	&& rpm --import "http://keyserver.ubuntu.com/pks/lookup?op=get&search=0x3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF" \
    && yum-config-manager --add-repo http://download.mono-project.com/repo/centos/ \
    && yum install -y mono-complete \
    && INSTALL_PKGS="tar unzip bc which lsof java-1.8.0-openjdk java-1.8.0-openjdk-devel" \
    && yum install -y $INSTALL_PKGS \
    && rpm -V $INSTALL_PKGS \
    && yum clean all -y \
    && curl -L https://github.com/SonarSource/sonar-scanner-msbuild/releases/download/4.0.2.892/sonar-scanner-msbuild-4.0.2.892.zip -o sonar-scanner-msbuild-4.0.2.892.zip \
    && mkdir /usr/lib/sonar-scanner  \
    && unzip sonar-scanner-msbuild-4.0.2.892.zip -d /usr/lib/sonar-scanner \
    && chmod -R a+rx /usr/lib/sonar-scanner \
    && rm sonar-scanner-msbuild-4.0.2.892.zip \
    && rm -R /opt/app-root/.pki \
    && popd


USER 1001

env PATH "$PATH:/usr/lib/sonar-scanner/" 
