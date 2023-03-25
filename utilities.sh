#!/bin/bash

data_2_volume () {
    docker volume create --name ${1}
    docker run -v ${1}:/data --name helper busybox true
    pushd ${2}
    docker cp . helper:/data
    docker rm helper
    popd
}

volume_2_backup () {
    docker run --rm -v ${1}:/data -v $(pwd):/backup alpine:latest tar cvf /backup/${1}.tar -C /data .
}

backup_2_volume () {
    docker volume create --name ${1}
    docker run --rm -v ${1}:/data -v $(pwd):/backup alpine:latest tar -xvf /backup/${2} -C /data/
}