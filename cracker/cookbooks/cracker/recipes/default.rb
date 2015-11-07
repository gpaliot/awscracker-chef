#
# Cookbook Name:: cracker
# Recipe:: default
#

# add the EPEL repo
yum_repository 'epel' do
  description 'Extra Packages for Enterprise Linux'
  mirrorlist 'http://mirrors.fedoraproject.org/mirrorlist?repo=epel-6&arch=$basearch'
  gpgkey 'http://dl.fedoraproject.org/pub/epel/RPM-GPG-KEY-EPEL-6'
  action :create
end

# install packages
package 'bash-completion'
package 'p7zip'
package 'Development tools'

# install Nvidia driver
remote_file '/root/NVIDIA-Linux-x86_64-352.55.run' do
  source 'http://us.download.nvidia.com/XFree86/Linux-x86_64/352.55/NVIDIA-Linux-x86_64-352.55.run'
  owner 'root'
  group 'root'
  mode '0700'
  action :create
end

# install cudaHashcat
remote_file '/root/cudaHashcat-1.37.7z' do
  source 'http://hashcat.net/files/cudaHashcat-1.37.7z'
  owner 'root'
  group 'root'
  mode '0700'
  action :create
end

