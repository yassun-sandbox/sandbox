#=======================================================================================================================
# Base: SELinux
#=======================================================================================================================

# 無効化 (即時)
bash 'base::selinux::setenforce' do
  not_if <<-EOC
    getenforce | egrep -q 'Permissive|Disabled'
  EOC
  code <<-EOC
    setenforce Permissive
  EOC
end

# 無効化 (再起動後)
template '/etc/selinux/config' do
  source 'selinux.config.erb'
end
