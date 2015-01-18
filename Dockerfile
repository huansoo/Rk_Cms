FROM tomcat:jre7

MAINTAINER wendal "wendal1985@gmail.com"

ENV MAVEN_VERSION 3.2.5

RUN rm -fr /usr/local/tomcat/webapps/* && \
	mkdir /usr/local/tomcat/webapps/ROOT

RUN apt-get install -y --force-yes zip

RUN curl -sSL http://archive.apache.org/dist/maven/maven-3/$MAVEN_VERSION/binaries/apache-maven-$MAVEN_VERSION-bin.tar.gz | tar xzf - -C /usr/share \
  && mv /usr/share/apache-maven-$MAVEN_VERSION /usr/share/maven \
  && ln -s /usr/share/maven/bin/mvn /usr/bin/mvn
  
RUN /usr/bin/mvn war:war && unzip -d /usr/local/tomcat/webapps/ROOT/ target/rk_cms.war && rm -fr target