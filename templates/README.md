# ${TODO_REPLACE_repo_name}

Dojo docker image that... TODO.

## Usage
Required files:
   * ... TODO

Example usage:
```
# TODO
dojo "bash --version"
```

## Development

### Dependencies
* Bash
* Docker daemon
* Bats
* Dojo

Install Bats:
```
git clone --depth 1 https://github.com/sstephenson/bats.git /opt/bats &&\
  git clone --depth 1 https://github.com/ztombol/bats-support.git /opt/bats-support &&\
  git clone --depth 1 https://github.com/ztombol/bats-assert.git /opt/bats-assert &&\
  /opt/bats/install.sh /usr/local
```

### Lifecycle
1. Make your changes in a feature branch.
2. Build docker image:
```
./tasks build
```
3. Test:
```
./tasks test
```
4. Run docker container interactively:
```
./tasks example
```
5. Merge your feature branch to master or create a Pull Request.
