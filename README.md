# ccpp-env

A C/C++ environment

Install docker if have not installed, follow instuction on docker website https://docs.docker.com/desktop/.


build a C/C++ environment docker image

    docker build -t ccpp-env .

Run docker container

```shell
    docker run -p 5000:22 -i --rm -v `pwd`:/ccpp -w /ccpp -t ccpp-env /bin/bash

    cd example
    make clean
    make all
```

The docker command parameters are explained in the following section

* -p 5000:22, map container port 22 to host machine port 5000
* -i, interactive mode
* --rm, remove the container after exit it
* -v `pwd`:/ccpp, map the current working directory to /ccpp in the container
* -w /ccpp, set the workign directory to /ccpp when the container start
* -t ccpp-env, using ccpp-env docker image
* /bin/bash, running bash after the container start

add any code inside example folder and using the same command run it
