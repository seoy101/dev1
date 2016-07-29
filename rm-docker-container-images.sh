#!/bin/bash

# make ckerfile

usage()
{
        echo "Usage: $0 [-d \"t.docker.io\"]"
       	echo " -d : docker image name"
        1>&2;
	exit 1;
}

while getopts ":d:" o; do
    case "${o}" in
        d)
		d=${OPTARG}
		sudo docker rm $(sudo docker ps -a -q --filter status=exited)
		sudo docker images -a | grep ${d} |tr -s ' ' | cut -d ' ' -f 3 | xargs docker rmi 
            ;;
	?)
            usage
            ;;
    esac
done
shift $((OPTIND-1))

if [ -z "${d}" ] ; then
  usage
fi

