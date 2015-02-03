case node["platform_family"]
  when "debian"
    include_recipe "rethinkdb::_apt.rb"

  when "rhel"
    include_recipe "rethinkdb::_yum.rb"
end

