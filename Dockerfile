FROM ubuntu:14.04

# Install a working version of java
RUN apt-get -y update
RUN apt-get -y install git
RUN apt-get -y --fix-missing install openjdk-7-jdk

# Copy the pacakges and filesto the container
RUN mkdir -p /plugins
COPY ./spigot-1.8.8.jar /spigot-1.8.8.jar
COPY ./eula.txt /eula.txt
COPY ./run.sh /run.sh
COPY ./raspberryjuice-1.7.jar /plugins/raspberryjuice-1.7.jar

# Unzip and run the start script
# Run the server
RUN chmod +x /run.sh

EXPOSE 4711 
CMD ["./run.sh"]
