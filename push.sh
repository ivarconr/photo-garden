if [ -z "${TRAVIS_PULL_REQUEST}" ] || [ "${TRAVIS_PULL_REQUEST}" == "false" ]; then
  if [ "${TRAVIS_BRANCH}" == "master" ]; then
    pip install --user awscli
    export PATH=${PATH}:${HOME}/.local/bin
    eval $(aws ecr get-login --no-include-email --region eu-west-1)
    docker tag photo-garden-search-api:latest ${REMOTE_IMAGE_URL}
    docker push ${REMOTE_IMAGE_URL}
  else
    echo "Not master, not deploying"
  fi
else
  echo "Pull request, not deploying"
fi
