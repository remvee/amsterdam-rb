RAILS_GEM_VERSION = '2.3.2' unless defined? RAILS_GEM_VERSION

require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|
  config.frameworks -= [ :active_resource, :action_mailer ]

  config.action_controller.session = {
    :session_key => '_amsterdam-rb_session',
    :secret      => '520c72253780c53153d33ed866d0f2ac4603b0c8c5818d2ca20102beec90163f06ab7c102519e21436e4a644ba5f531771eb3f978e07e4344d06670dbc8b03b5'
  }

  config.gem 'mislav-will_paginate', :version => '~> 2.3.2', :lib => 'will_paginate', :source => 'http://gems.github.com/'
end
