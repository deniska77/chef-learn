file 'default www' do
	path '/var/www/html/index.html'
	content 'Hello world! v2.0'

end

webnodes=search('node','role:web')

webnodes.each do |node|
	puts node
end

node["apache"]["sites"].each do |siteName, data|
	
	document_root = "/content/sites/#{siteName}"
	
	directory document_root do
	mode "0755"
	recursive true
	end
template "/etc/httpd/conf.d/#{siteName}.conf" do
	source "vhost.erb"
	mode "0644"
	variables( 
		:document_root => document_root,
		:port => data["port"],
		:domain => data["domain"]
	)
end	
	

end
