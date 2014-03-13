Description
===========

A Chef Exception  Handler for [Flowdock](http://www.flowdock.com).

Cookbook Install
================

1. Create a [Flowdock](http://www.flowdock.com) account.
2. Create a Flowdock flow.
3. Retrieve your Flowdock API Token.
4. Download the [chef_handler](http://community.opscode.com/cookbooks/chef_handler)
Cookbook.
5. Given you've retrieved your Flowdock API Token as **API_TOKEN**, add a Recipe similar to the example 
below:

```ruby
include_recipe 'chef_handler'

gem_package('chef-handler-flowdock'){action :nothing}.run_action(:install)

chef_handler 'Chef::Handler::FlowdockHandler' do
  action :enable
  attributes :api_token => "API_TOKEN",
             :from => {:name => "YOUR_NAME", :address => "YOUR_EMAIL"}
  source File.join(Gem::Specification.find{|s| s.name == 'chef-handler-flowdock'}.gem_dir,
    'lib', 'chef', 'handler', 'flowdock_handler.rb')
end
```

See also: [Enable Chef Handler with LWRP](http://docs.opscode.com/handlers.html#run-from-recipes)

Manual Install
==============

1. Create a [Flowdock](http://www.flowdock.com) account.
2. Create a Flowdock flow.
3. Retrieve your Flowdock API Token.
4. Install the `chef-handler-flowdock` Gem on your node:

```
gem install chef-handler-flowdock
```

5. Given you've retrieved your Flowdock API Token as **API_TOKEN**, add it to your `/etc/chef/client.rb` on your node:

```
require '/var/chef/handlers/flowdock_handler'
exception_handlers << Chef::Handler::FlowdockHandler.new(:api_token => "API_TOKEN")
```


Author
======
[Matthias Marschall](https://github.com/mmarschall)


Copyright
=========
Copyright 2012 Matthias Marschall (mm@agileweboperations.com)


License
=======
Apache License 2.0
