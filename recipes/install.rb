run_user = node['rethinkdb']['config']['runuser']
run_group = node['rethinkdb']['config']['rungroup']
base_dir = node['rethinkdb']['config']['base_directory']

execute 'chown_rethinkdb' do
  command "chown -R #{run_user}.#{run_group} #{base_dir}"
  action :nothing
end

package 'rethinkdb' do
  version node['rethinkdb']['version']
  action :install
  notifies :run, "execute[chown_rethinkdb]", :immediately
end
