FROM seansummers/alpine-java
MAINTAINER seansummers@gmail.com
RUN [ "/sbin/apk.static", "add", "curl", "bash" ]
ENV JYTHON_VERSION 2.7.0
RUN curl -OL "http://search.maven.org/remotecontent?filepath=org/python/jython-installer/${JYTHON_VERSION}/jython-installer-${JYTHON_VERSION}.jar"\
 && java -jar jython-installer-${JYTHON_VERSION}.jar -s -t minimum -i mod -d /usr/local/jython-${JYTHON_VERSION}\
 &&  rm -f jython-installer-${JYTHON_VERSION}.jar\
 && ln -s /usr/local/jython-${JYTHON_VERSION}/bin/* /usr/local/bin/
ENTRYPOINT ["/usr/local/bin/jython"]
