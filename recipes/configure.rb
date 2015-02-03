template default["rethinkdb"]["config_file"] do
  user instance.user
  group instance.group
  source "rethinkdb.conf.erb"
  mode 00440
end
