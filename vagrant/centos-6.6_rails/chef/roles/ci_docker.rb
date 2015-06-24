name "ci_docker"
run_list(
  "recipe[base]",
  "recipe[base::locale]",
  "recipe[base::selinux]",
  "recipe[base::history]",
  "recipe[yum]",
  "recipe[git]",
  "recipe[ruby::rbenv]",
  "recipe[ruby::ruby]",
  "recipe[mysql]",
)
