#!/bin/bash

# this does ecr stuff for docker images.

for repository in "$@"
do
    echo "$repository"
    docker push $AWS_ACCOUNT_ID.dkr.ecr.$AWS_DEFAULT_REGION.amazonaws.com/$repository:latest
done
