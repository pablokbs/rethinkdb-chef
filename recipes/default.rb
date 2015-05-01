#
# Cookbook Name:: rethinkdb-chef
# Recipe:: default
#
# Copyright (C) 2015 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
include_recipe "apt"
include_recipe "yum"

case node["platform_family"]
  when "debian"
    include_recipe "rethinkdb::_apt"
    include_recipe "rethinkdb::install"

  when "rhel"
    include_recipe "rethinkdb::_yum"
    include_recipe "rethinkdb::install"
end

service "rethinkdb" do
  supports :status => true, :start => true, :stop => true, :restart => true
  action [:enable]
end

include_recipe "rethinkdb::configure"

