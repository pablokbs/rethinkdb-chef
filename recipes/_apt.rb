apt_repository "rethinkdb" do
  uri          "http://download.rethinkdb.com/apt"
  components   ["main"]
  distribution node["lsb"]["codename"]
  key          "http://download.rethinkdb.com/apt/pubkey.gpg"
  action       :add
  notifies     :run, "execute[apt-get update]", :immediately
end

package "rethinkdb" do
  version node["rethinkdb"]["version"]
  action :install
end
