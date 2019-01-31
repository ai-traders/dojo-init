load '/opt/bats-support/load.bash'
load '/opt/bats-assert/load.bash'

@test "/usr/bin/entrypoint.sh returns 0" {
  run /bin/bash -c "dojo -c Dojofile.to_be_tested \"pwd && whoami\""
  assert_line --partial "dojo init finished"
  assert_line --partial "/dojo/work"
  assert_line --partial "Dojo entrypoint info"
  refute_output --partial "root"
  assert_equal "$status" 0
}
@test "correct bash is installed" {
  run /bin/bash -c "dojo -c Dojofile.to_be_tested \"bash --version\""
  assert_line --partial "GNU bash, version"
  assert_equal "$status" 0
}
@test "custom env variables are preserved" {
  run /bin/bash -c "export ABC=1212 && dojo -c Dojofile.to_be_tested \"env | grep ABC\""
  assert_line --partial "ABC=1212"
  assert_equal "$status" 0
}
