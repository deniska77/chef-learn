file '/etc/motd' do
	content "Hostname is: #{node['fqdn']}"
end 
