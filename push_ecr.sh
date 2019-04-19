#!/bin/bash

# this does ecr stuff for docker images.

for repository in "$@"
do
    container=$AWS_ACCOUNT_ID.dkr.ecr.$AWS_DEFAULT_REGION.amazonaws.com/$repository:latest
    echo "container: $container"
    docker push $container
done
