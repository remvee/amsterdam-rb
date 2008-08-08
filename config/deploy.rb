set :application, "amsterdam-rb"
set :domain, "amsterdam-rb.org"
set :deploy_to, "/u/apps/#{application}"
set :rails_env, "production"
set :mongrel_conf, "#{current_path}/config/mongrel_cluster.yml"

set :scm, :subversion
set :repository, "--username remco http://svn.rubyenrails.nl/amsterdam-rb"

role :web, domain
role :app, domain
role :db, domain, :primary => true
