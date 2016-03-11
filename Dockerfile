FROM java:openjdk-7-jre
MAINTAINER Craig Weber "crgwbr@gmail.com"

ENV SEYREN_VERSION 1.3.0
ENV SEYREN_GROUP seyren
ENV SEYREN_USER seyren
ENV SEYREN_USER_HOME /home/seyren/

RUN wget http://github.com/scobal/seyren/releases/download/"$SEYREN_VERSION"/seyren-"$SEYREN_VERSION".jar -O /opt/seyren.jar
ADD run-seyren.sh /usr/bin/run-seyren.sh
RUN chmod +x /usr/bin/run-seyren.sh

RUN groupadd -r $SEYREN_GROUP -g 433
RUN useradd -u 431 -r -g $SEYREN_GROUP -d $SEYREN_USER_HOME -s /sbin/nologin -c "Seyren user" $SEYREN_USER
RUN mkdir -p $SEYREN_USER_HOME
RUN chown -R $SEYREN_USER:$SEYREN_GROUP $SEYREN_USER_HOME
WORKDIR $SEYREN_USER_HOME
USER $SEYREN_USER

CMD /usr/bin/run-seyren.sh
EXPOSE 8080
