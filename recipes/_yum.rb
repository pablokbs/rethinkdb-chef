yum_repository 'rethinkdb' do
  description "RethinkDB Stable Repo"
  baseurl node['rethinkdb']['redhat']['repo']
  action :create
end
