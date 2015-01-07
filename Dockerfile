FROM seansummers/alpine-java:jre7
MAINTAINER seansummers@gmail.com
RUN [ "/sbin/apk.static", "add", "bash" ]
ENV JYTHON_VERSION 2.5.3
RUN apk.static add axel \
 && axel -o jython-installer-${JYTHON_VERSION}.jar \
     "http://search.maven.org/remotecontent?filepath=org/python/jython-installer/${JYTHON_VERSION}/jython-installer-${JYTHON_VERSION}.jar" \
 && apk.static del axel \
 && java -jar jython-installer-${JYTHON_VERSION}.jar -s -t minimum -d /usr/local/jython-${JYTHON_VERSION} \
 && rm -f jython-installer-${JYTHON_VERSION}.jar \
 && ln -s /usr/local/jython-${JYTHON_VERSION}/jython /usr/local/bin/
CMD [ "/bin/bash" ]
