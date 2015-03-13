apt_repository "rethinkdb" do
  uri          node['rethinkdb']['debian']['repo']
  components   ["main"]
  distribution node["lsb"]["codename"]
  key          node['rethinkdb']['debian']['pubkey']
  action       :add
  notifies     :run, "execute[apt-get update]", :immediately
end
