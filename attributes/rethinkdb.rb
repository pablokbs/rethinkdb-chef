default["rethinkdb"]["install_method"] = "package"
default["rethinkdb"]["version"] = "1.16.0"
default["rethinkdb"]["src_url"] = "http://download.rethinkdb.com/dist"
default["rethinkdb"]["join_cluster"] = false

instance_name = "chef"
instance_dir = "/var/lib/rethinkdb#{instance_name}"
pid_file = "/var/run/rethinkdb/#{instance_name}.pid"
config_file = "/etc/rethinkdb/instances.d/#{instance_name}.conf"
default["rethinkdb"]["config_file"] = config_file


default["rethinkdb"]["config"]["name"] = instance_name
default["rethinkdb"]["config"]["cores"] = node["cpu"]["total"].to_i
default["rethinkdb"]["config"]["runuser"] = "rethinkdb"
default["rethinkdb"]["config"]["rungroup"] = "rethinkdb"
default["rethinkdb"]["config"]["cache-size"] = node["memory"]["total"][0..-3].to_i / 1024 / 2
default["rethinkdb"]["config"]["io-threads"] = 64
default["rethinkdb"]["config"]["no-http-admin"] = nil
default["rethinkdb"]["config"]["http-port"] = 8080
default["rethinkdb"]["config"]["reql-http-proxy"] = nil
default["rethinkdb"]["config"]["port-offset"] = 0
default["rethinkdb"]["config"]["cluster-port"] = 29015
default["rethinkdb"]["config"]["driver-port"] = 28015
default["rethinkdb"]["config"]["bind"] = "127.0.0.1"
default["rethinkdb"]["config"]["join"] = nil
default["rethinkdb"]["config"]["server-name"] = node["hostname"]
default["rethinkdb"]["config"]["directory"] = instance_dir
default["rethinkdb"]["config"]["log-file"] = "#{instance_dir}/#{instance_name}.log"
default["rethinkdb"]["config"]["pid-file"] = pid_file
