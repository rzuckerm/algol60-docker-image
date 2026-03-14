#!/bin/sh
DOCKER_IMAGE=$1
DOCKER_RUN="docker run --rm -i -v $(pwd):/local -w /local ${DOCKER_IMAGE}"

CMD="marst -l 255 -o hello_world.c hello_world.alg && \
    gcc -o hello_world hello_world.c -lm -lalgol && \
    ./hello_world && \
    rm -f hello_world hello_world.c"
RESULT="$(${DOCKER_RUN} sh -c "${CMD}")"
echo "${RESULT}"
if [ "${RESULT}" = "Hello, world!" ]
then
    echo "PASSED"
else
    echo "FAILED"
    exit 1
fi
