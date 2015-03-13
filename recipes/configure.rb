template node['rethinkdb']['config_file'] do
  user node['rethinkdb']['config']['runuser']
  group node['rethinkdb']['config']['runuser']
  source 'rethinkdb.conf.erb'
  mode 00440
  notifies :restart, 'service[rethinkdb]', :delayed
end
