include_recipe "build-essential"
include_recipe "chef_handler"


# We need httpart <0.12 as in 0.12 httparty depends on json 1.8 and this introduces conflict
chef_gem "httparty" do
  version "=0.11.0"
end
chef_gem "hipchat"

hipchat_secrets = Chef::DataBagItem.load('secrets', 'hipchat')

# Install the handler to the handlers folder
template "#{node['chef_handler']['handler_path']}/hipchat-notification-handler.rb" do
  source "hipchat-notification-handler.erb"
  owner "root"
  group "root"
  mode "0644"
  variables(
    :api_token => hipchat_secrets['api_token'],
    :room_name => hipchat_secrets['room_name']
  )
end

# Configure the handler
chef_handler "HipChat::NotifyRoom" do
  source "#{node['chef_handler']['handler_path']}/hipchat-notification-handler.rb"
  supports :exception => true
  arguments :notify_users => false
  action :enable
end
