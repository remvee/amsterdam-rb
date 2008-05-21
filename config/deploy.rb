require 'deprec/recipes'

set :application, "amsterdam-rb"
set :domain, "amsterdam-rb.org"

role :web, domain
role :app, domain
role :db, domain, :primary => true

set :repository,  "--username remco http://svn.rubyenrais.nl/amsterdam-rb"
set :rails_env, "production"

set :mongrel_user, 'amsterdam-rb'
set :mongrel_group, 'deploy'

set :apache_server_name, domain
set :apache_proxy_port, 3050
set :apache_proxy_servers, 3
