#Install /usr/bin script that takes message as a parameter and sends it to HipChat room

include_recipe "hipchat"
include_recipe "ruby"

# Install the hipchat notification gem
gem_package "hipchat"

hipchat_secrets = Chef::DataBagItem.load('secrets', 'hipchat')

# Install the handler to the handlers folder
template "/usr/bin/hipchat" do
  source "hipchat-command.erb"
  owner "root"
  group "root"
  mode "0755"
  variables(
    :api_token => hipchat_secrets['api_token'],
    :room_name => hipchat_secrets['room_name']
  )
end
