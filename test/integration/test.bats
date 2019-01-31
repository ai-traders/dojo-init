load '/opt/bats-support/load.bash'
load '/opt/bats-assert/load.bash'

init_script="$(pwd)/dojo-init"

function clean() {
  rm -rf docker-myrepo-dojo
}

@test "clean on setup" {
  clean
}

@test "dojo-init fails if repo_name not set" {
  run ${init_script}
  assert_output --partial "repo_name not set"
  assert_equal "$status" 1
}
@test "dojo-init fails if repo_name directory already exists" {
  mkdir -p docker-myrepo-dojo
  run ${init_script} docker-myrepo-dojo
  assert_output --partial "docker-myrepo-dojo directory already exists"
  assert_equal "$status" 1
  rm -rf docker-myrepo-dojo
}
@test "dojo-init succeeds if dojo version set" {
  rm -rf docker-myrepo-dojo
  run ${init_script} docker-myrepo-dojo 0.2.0
  assert_output --partial "Using dojo version: 0.2.0"
  assert_output --partial "Creating docker-myrepo-dojo..."
  assert_equal "$status" 0

  run cat docker-myrepo-dojo/image/Dockerfile
  assert_output --partial "-b 0.2.0 http://git.ai-traders.com/dojo/dojo.git"
  assert_equal "$status" 0

  run cat docker-myrepo-dojo/image/Dockerfile.Alpine
  assert_output --partial "-b 0.2.0 http://git.ai-traders.com/dojo/dojo.git"
  assert_equal "$status" 0

  run cat docker-myrepo-dojo/tasks
  assert_output --partial "image_name=\"myrepo-dojo\""
  assert_equal "$status" 0
}
@test "generated docker image dir has valid tasks - build" {
  run bash -c "cd ./docker-myrepo-dojo && ./tasks build"
  assert_output --partial "Successfully built"
  assert_output --partial "Successfully tagged myrepo-dojo:temp-alpine"
  assert_equal "$status" 0
}
@test "generated docker image dir has valid tasks - test" {
  run bash -c "cd ./docker-myrepo-dojo && ./tasks test"
  assert_output --partial "3 tests, 0 failures"
  assert_output --partial "Testing image: myrepo-dojo:temp-alpine"
  assert_output --partial "Testing image: myrepo-dojo:temp"
  assert_equal "$status" 0
}

@test "clean on teardown" {
  clean
}
