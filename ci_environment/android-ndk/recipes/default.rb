setup_root        = node['android-ndk']['setup_root'].to_s.empty? ? node['ark']['prefix_home'] : node['android-ndk']['setup_root']
android_ndk_home  = File.join(setup_root, node['android-ndk']['name'])
download_file_to  = [setup_root, File.basename(node['android-ndk']['download_url'])].join(File::SEPARATOR)

remote_file download_file_to do
  source node['android-ndk']['download_url']
  mode 0755
end

execute 'Expand Android NDK archive' do
  command       "./#{File.basename(node['android-ndk']['download_url'])} >/dev/null"
  user          node['android-ndk']['owner']
  group         node['android-ndk']['group']
end

# TODO find a way to handle 'chmod stuff' below with own chef resource (idempotence stuff...)
bash 'Grant all users to read android files' do
  user          node['android-ndk']['owner']
  group         node['android-ndk']['group']
  code <<-EOF
    mv #{setup_root}/android-ndk-#{node['android-ndk']['version']} #{android_ndk_home}
    chown -R #{node['android-ndk']['owner']}:#{node['android-ndk']['group']} #{android_ndk_home}
  EOF
end

#
# Configure environment variables (ANDROID_HOME and PATH)
#
template "/etc/profile.d/android-ndk.sh"  do
  source "android-ndk.sh.erb"
  mode   0644
  owner  node['android-ndk']['owner']
  group  node['android-ndk']['group']
  variables(
    :android_ndk => android_ndk_home
  )
end
