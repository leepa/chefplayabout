#
# Cookbook Name:: docked_go
# Recipe:: default
#
directory '/srv/docked_go' do
  owner 'root'
  mode '0755'
  recursive true
  action :create
end

cookbook_file "/srv/docked_go/main.go" do
  source "main.go"
  mode "0644"
  notifies :restart, 'docker_container[worker]'
end

docker_service 'default' do
  action [:create, :start]
end

docker_image 'golang' do
  tag 'onbuild'
  action :pull
end

docker_container 'worker' do
	repo 'golang'
  tag 'onbuild'
  port '8484:8484'
  env [
    "HOSTNAME=#{node['hostname']}"
  ]
	volumes ['/srv/docked_go:/go/src/app']
  command 'go run /go/src/app/main.go'
	action [:create, :run, :run_if_missing]
end

firewall_rule 'worker' do
  port     8484
  command  :allow
end
