yum_repository 'rethinkdb' do
  description "RethinkDB Stable Repo"
  baseurl node['rethinkdb']['redhat']['repo']
  gpgcheck false
  action :create
end
