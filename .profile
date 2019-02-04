#!/bin/bash
echo $PWD
echo "Downloading Pinpoint Zip File Now "
wget https://raw.githubusercontent.com/maheswarisk/pinpoint_agent_repo/master/pinpoint.config	
#mkdir pinpoint_agent				   
#cd pinpoint_agent                              
wget https://raw.githubusercontent.com/maheswarisk/pinpoint_agent_repo-1/master/pinpoint-agent-1.7.1.zip  
echo "Downloaded Pinpoint Zip File"
echo " UNZIP STARTED "
unzip pinpoint-agent-1.7.1.zip -d pinpoint_agent 
echo " UNZIP DONE "
#ls                                 
#rm -r  pinpoint-agent-1.7.1.zip 
mv /home/vcap/app/pinpoint.config pinpoint_agent/pinpoint.config
echo " MOVE DONE "
echo $JAVA_OPTS
export JAVA_OPTS="$JAVA_OPTS -javaagent:/home/vcap/app/pinpoint_agent/pinpoint-bootstrap-1.7.1.jar"

export JAVA_OPTS="$JAVA_OPTS -Dpinpoint.agentId=ProfilePCFAgent"

export JAVA_OPTS="$JAVA_OPTS -Dpinpoint.applicationName=ProfilePCFApp"
#export JAVA_OPTS= '-javaagent:/home/vcap/app/pinpoint_agent/pinpoint-bootstrap-1.7.1.jar -Dpinpoint.agentId=ProfilePCFAgent -Dpinpoint.applicationId=ProfilePCFApp'
echo $JAVA_OPTS
echo " EOF "
#exit 0
