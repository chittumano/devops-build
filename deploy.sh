#!/bin/bash
if [[ $GIT_BRANCH == "origin/dev" ]]; then
    # Build your project
    sh 'chmod +x build.sh'
    sh './build.sh'
    docker login -u rkmctwo1 -p $DOCKER_PASSWORD
    docker tag react-capstone rkmctwo1/dev
    docker push rkmctwo1/dev

elif [[ $GIT_BRANCH == "origin/prod" ]]; then
    sh 'chmod +x build.sh'
    sh './build.sh'
    docker login -u rkmctwo1 -p $DOCKER_PASSWORD
    docker tag react-capstone rkmctwo1/prod 
    docker push rkmctwo1/prod
fi
