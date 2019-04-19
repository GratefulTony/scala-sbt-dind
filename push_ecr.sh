#!/bin/bash

# this does ecr stuff for docker images.

for repository in "$@"
do
    container=$AWS_ACCOUNT_ID.dkr.ecr.$AWS_DEFAULT_REGION.amazonaws.com/$repository:latest
    echo "container: $container"

    # hack to idempotently create the repos.
    aws ecr describe-repositories --repository-names $repository 2>&1 > /dev/null
    status=$?
    if [[ ! "${status}" -eq 0 ]]; then
        aws ecr create-repository --repository-name $repository
    fi
    
    # push it out.
    docker tag $repository:latest $container
    docker push $container
done
