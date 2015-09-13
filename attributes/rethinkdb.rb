default['rethinkdb']['instance_name'] = 'default'
default['rethinkdb']['install_method'] = 'package'
default['rethinkdb']['debian_version'] = "2.1.3~0#{node['lsb']['codename']}"
default['rethinkdb']['src_url'] = 'http://download.rethinkdb.com/dist'
default['rethinkdb']['debian']['repo'] = 'http://download.rethinkdb.com/apt'
default['rethinkdb']['debian']['pubkey'] = "#{default['rethinkdb']['debian']['repo']}/pubkey.gpg"
default['rethinkdb']['redhat_version'] = '2.1.3'
default['rethinkdb']['redhat']['repo'] = "http://download.rethinkdb.com/centos/#{node['platform_version'].to_i}/#{node[:languages][:ruby][:host_cpu]}/"

instance_name = default['rethinkdb']['instance_name']
base_dir = "/var/lib/rethinkdb/"
instance_dir = "#{base_dir}/instances.d"
pid_file = "/var/run/rethinkdb/#{instance_name}.pid"
default["rethinkdb"]["config_dir"] = "/etc/rethinkdb/instances.d"
config_file = "#{default["rethinkdb"]["config_dir"]}/#{instance_name}.conf"
default['rethinkdb']['config_file'] = config_file


default['rethinkdb']['join_cluster'] = false
default['rethinkdb']['config']['name'] = instance_name
default['rethinkdb']['config']['cores'] = node['cpu']['total'].to_i
default['rethinkdb']['config']['runuser'] = 'rethinkdb'
default['rethinkdb']['config']['rungroup'] = 'rethinkdb'
default['rethinkdb']['config']['cache-size'] = node['memory']['total'][0..-3].to_i / 1024 / 2
default['rethinkdb']['config']['io-threads'] = 64
default['rethinkdb']['config']['no-http-admin'] = true
default['rethinkdb']['config']['http-port'] = 8080
default['rethinkdb']['config']['reql-http-proxy'] = nil
default['rethinkdb']['config']['port-offset'] = 0
default['rethinkdb']['config']['cluster-port'] = 29015
default['rethinkdb']['config']['driver-port'] = 28015
default['rethinkdb']['config']['bind'] = '127.0.0.1'
default['rethinkdb']['config']['join'] = nil
default['rethinkdb']['config']['server-name'] = node['hostname'].gsub(/-|\.|/, '_')
default['rethinkdb']['config']['base_directory'] = base_dir
default['rethinkdb']['config']['instance_directory'] = "#{instance_dir}/#{instance_name}"
default['rethinkdb']['config']['log-file'] = "#{instance_dir}/#{instance_name}/#{instance_name}.log"
default['rethinkdb']['config']['pid-file'] = pid_file
