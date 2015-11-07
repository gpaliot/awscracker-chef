#
# Cookbook Name:: cracker
# Recipe:: default
#

# enable EPEL
template '/etc/yum.repos.d/epel.repo' do
    source 'epel.repo'
    owner 'root'
    group 'root'
    mode '0755'
    backup 5
end

# install packages
package 'bash-completion'
package 'p7zip'
#package 'Development tools'

# install Nvidia driver
remote_file '/root/NVIDIA-Linux-x86_64-352.55.run' do
  source 'http://us.download.nvidia.com/XFree86/Linux-x86_64/352.55/NVIDIA-Linux-x86_64-352.55.run'
  owner 'root'
  group 'root'
  mode '0700'
  action :create
end

execute 'nvidia_installer' do
      command '/root/NVIDIA-Linux-x86_64-352.55.run -s'
      ignore_failure true
      #creates ''
end


# install cudaHashcat
remote_file '/root/cudaHashcat-1.37.7z' do
  source 'http://hashcat.net/files/cudaHashcat-1.37.7z'
  owner 'root'
  group 'root'
  mode '0700'
  action :create
end

execute 'hashcat_unpack' do
    command '/usr/bin/7za x -o/opt /root/cudaHashcat-1.37.7z'
    command 'ln -sf /opt/cudaHashcat-1.37 /opt/hashcat'
    creates '/opt/hashcat'
end
