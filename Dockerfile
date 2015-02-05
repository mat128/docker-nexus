FROM ubuntu:14.04
MAINTAINER Usman Ismail <usman@techtraits.com>
RUN apt-get -qq update
RUN apt-get -qq install openjdk-6-jre-headless
RUN apt-get -qq install wget
RUN mkdir -p /opt/sonatype-nexus /opt/sonatype-work /opt/sonatype-work/nexus
RUN ["wget", "-O", "/tmp/nexus-oss-webapp-1.9.2.4-bundle.tar.gz", "http://download.sonatype.com/nexus/oss/nexus-oss-webapp-1.9.2.4-bundle.tar.gz"]
RUN tar -zxvf /tmp/nexus-oss-webapp-1.9.2.4-bundle.tar.gz -C /opt/sonatype-nexus --strip-components=1
RUN useradd --user-group --system --home-dir /opt/sonatype-nexus nexus
RUN chown -R nexus:nexus /opt/sonatype-work /opt/sonatype-nexus /opt/sonatype-work/nexus

USER nexus

CMD ["/opt/sonatype-nexus/bin/jsw/linux-x86-64/nexus","console"]
VOLUME /opt/sonatype-work
EXPOSE 8081
