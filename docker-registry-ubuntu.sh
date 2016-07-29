#! /bin/sh

sudo echo 211.249.63.201 t.docker.io >> /etc/hosts

sudo sed -i 's/DOCKER_OPT=""/DOCKER_OPT="--insecure-registry 211.249.63.201:5000"/' /ect/default/docker

sudo sed -i 's/DOCKER_OPT=""/DOCKER_OPT="--insecure-registry 211.249.63.201:5000"/' /ect/init.d/docker

sudo service docker restart

sudo docker run --restart=on-failure:10 -d -p 5000:5000 -e standalone=True -e disable_token_auth=True -v /tmp/registry/:/var/lib/registry/ --name registry registry:2
