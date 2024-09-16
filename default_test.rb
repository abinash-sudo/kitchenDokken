# Chef InSpec test for recipe dokken_podman::default

# The Chef InSpec reference, with examples and extensive documentation, can be
# found at https://docs.chef.io/inspec/resources/

# Test for the correct platform
if os.debian?
  # Test for Ubuntu/Debian (Nginx)
  
  # Check if the Nginx package is installed
  describe package('nginx') do
    it { should be_installed }
  end

  # Check if the custom HTML file exists with correct content, owner, and permissions
  describe file('/var/www/html/index.html') do
    it { should exist }
    its('content') { should match /<h1>Progress to Acquire ShareFile!<\/h1>/ }
    its('mode') { should cmp '0644' }
    its('owner') { should eq 'root' }
    its('group') { should eq 'root' }
  end

  # Check if the Nginx service is enabled and running
  describe service('nginx') do
    it { should be_enabled }
    it { should be_running }
  end

elsif os.redhat?
  # Test for CentOS/RHEL (User creation)
  
  # Check if the user 'centOSuser' exists
  describe user('centOSuser') do
    it { should exist }
    its('shell') { should eq '/bin/false' }
    its('uid') { should < 1000 }
  end

end

