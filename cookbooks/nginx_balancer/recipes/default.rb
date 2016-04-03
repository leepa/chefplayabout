include_recipe 'nginx::repo'
include_recipe 'nginx'

template "#{node[:nginx][:dir]}/sites-available/default" do
	source 'default_site.conf.erb'
	owner 'root'
	group 'root'
	mode '0644'
	variables(
		:ip_addresses => node[:custom_stuff][:ip_addresses]
	)
	notifies :reload, 'service[nginx]'
end

directory "#{node[:nginx][:dir]}/conf.d" do
  recursive true
  action :delete
	notifies :reload, 'service[nginx]'
end

firewall_rule 'http' do
  port     80
  command  :allow
end
