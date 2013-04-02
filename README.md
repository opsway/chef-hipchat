Opscode Chef HipChat integration and Monit hipchat utility
============

Includes two recipes:

* default.rb - integration as Chef exception handler
* command.rb - command line utility to send hipchat messages for Monit


Reports failures with node.name and exception details to your HipChat room

Based on:

https://github.com/mojotech/hipchat/blob/master/lib/hipchat/chef.rb

https://github.com/imeyer/chef-handler-graphite/wiki

http://community.opscode.com/questions/188

Usage
------------

 1. include_recipe "hipchat" in your cookbook

 2. Add Databag "secrets" and put an item to it with content, like:

    {
      "id": "hipchat",
      "api_token" : "2520f5f2f3d33cefb61c08asdfasdfasdf",
      "room_name" : "Main"
    }



OR

 include_recipe "hipchat::command"

You can then use 

    /usr/bin/hipchat "My test command"