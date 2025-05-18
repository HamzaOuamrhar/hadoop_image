ssh-keygen -t rsa -P '' -f ~/.ssh/id_rsa 
cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys 
chmod 0600 ~/.ssh/authorized_keys
/usr/sbin/sshd
/hadoop-3.2.3/bin/hdfs namenode -format
start-all.sh
while true; do sleep 1; done;