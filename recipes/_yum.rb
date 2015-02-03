yum_repository 'rethinkdb' do
  description "RethinkDB Stable Repo"
  baseurl "http://download.rethinkdb.com/centos/6/#{node[:languages][:ruby][:host_cpu]}/rethinkdb.repo"
  action :create
end

package "rethinkdb" do
  version node["rethinkdb"]["version"]
  action :install
end
