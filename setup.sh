#!/bin/bash

if [[ $# -ne 1 ]]; then 
	echo "usage $0 [ start | build | delete ]"
else
	if [ $1 == "start" ]; then

		sudo docker-compose up -d

	elif [ $1 == "delete" ]; then
		sudo docker-compose down
		while [ $(sudo docker ps | egrep -v '^CONTAINER' | wc -l) -ne 0 ]; do
        		sleep 2
		done;
		for id in $(sudo docker ps -a | awk '{print $1}' | egrep -v 'CONTAINER'); do 
			sudo docker rm $id 
		done
		for imid in $(sudo docker image ls | grep '^tolvmannen' | awk '{print $3}'); do 
			sudo docker image rm $imid 
		done
	else
		echo ""
	fi
fi
