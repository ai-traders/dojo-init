# dojo-init

Helps to create a [Dojo](https://github.com/ai-traders/dojo) docker image.

## Usage
Run:
```
git clone https://github.com/ai-traders/dojo-init.git
cd dojo-init
./dojo-init <your_docker_repo_name> [<dojo_version>]
./dojo-init docker-myname-dojo
```

This will create a directory named: `docker-myname-dojo` with all the files needed
 to develop a Dojo Docker image. The directory is supposed to be treated as
 a whole separate (git) repository.

The directory will contain `Dockerfile` and `Dockerfile.Alpine` - you are free
 to decide which one to use (or whether to use both).

There is also `tasks` file in `docker-myname-dojo` directory. It is used
 for operations, similarly to Makefile. Read `docker-myname-dojo/README.md`
 on how to use the `tasks` file.

## Install
`git clone` this project.

## Development
In order to run tests, install Bats:
```
git clone --depth 1 https://github.com/sstephenson/bats.git /opt/bats &&\
  git clone --depth 1 https://github.com/ztombol/bats-support.git /opt/bats-support &&\
  git clone --depth 1 https://github.com/ztombol/bats-assert.git /opt/bats-assert &&\
/opt/bats/install.sh /usr/local
```
and then run:
```
./tasks test
```
