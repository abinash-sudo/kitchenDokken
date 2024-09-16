#
# Cookbook:: dokken_podman
# Recipe:: default
#
# Copyright:: 2024, The Authors, All Rights Reserved.

# Detect the platform family
case node['platform_family']
when 'debian'
  # For Ubuntu (Debian family)

  # Install Nginx
  package 'nginx' do
    action :install
  end

  # Create a custom HTML page for Nginx

  file '/var/www/html/index.html' do
    content '<html>
  <head><title>Welcome to Nginx Demo!</title></head>
  <body><h1>Progress to Acquire ShareFile!</h1></body>
  </html>'
    mode '0644'
    owner 'root'
    group 'root'
  end

  # Ensure Nginx service is enabled and running
  service 'nginx' do
    action [:enable, :start]
  end

when 'rhel'
  # For CentOS (RHEL family)

  user 'centOSuser' do
    comment 'centOS user creation'
    system true
    shell '/bin/false'
  end

end
