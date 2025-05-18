FROM ubuntu:24.04
COPY hadoop-3.2.3.tar.gz .
RUN tar -zxvf hadoop-3.2.3.tar.gz
RUN apt update && apt install -y openjdk-8-jdk && apt install -y ssh && apt install -y openssh-server
RUN mkdir -p /var/run/sshd
RUN echo "root:root" | chpasswd
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
COPY confs/* /hadoop-3.2.3/etc/hadoop
COPY script.sh .
RUN chmod +x script.sh


ENV JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64 
ENV PATH=$PATH:/usr/lib/jvm/java-8-openjdk-amd64/bin 
ENV HADOOP_HOME=/hadoop-3.2.3
ENV PATH=$PATH:$HADOOP_HOME/bin 
ENV PATH=$PATH:$HADOOP_HOME/sbin 
ENV HADOOP_MAPRED_HOME=$HADOOP_HOME 
ENV YARN_HOME=$HADOOP_HOME 
ENV HADOOP_CONF_DIR=$HADOOP_HOME/etc/hadoop 
ENV HADOOP_COMMON_LIB_NATIVE_DIR=$HADOOP_HOME/lib/native 
ENV HADOOP_OPTS="-Djava.library.path=$HADOOP_HOME/lib/native" 
ENV HADOOP_STREAMING=$HADOOP_HOME/share/hadoop/tools/lib/hadoop-streaming-3.2.3.jar
ENV HADOOP_LOG_DIR=$HADOOP_HOME/logs 
ENV PDSH_RCMD_TYPE=ssh

ENV HDFS_NAMENODE_USER=root
ENV HDFS_DATANODE_USER=root
ENV HDFS_SECONDARYNAMENODE_USER=root
ENV YARN_RESOURCEMANAGER_USER=root
ENV YARN_NODEMANAGER_USER=root



CMD ./script.sh