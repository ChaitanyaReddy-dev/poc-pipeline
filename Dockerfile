FROM java:8

EXPOSE 7050

RUN sh -c 'touch demo-0.0.1-SNAPSHOT.jar'

ENTRYPOINT ["java","-jar","demo-0.0.1-SNAPSHOT.jar"]
