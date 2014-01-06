require 'rubygems'
require 'bundler'
require 'yaml'

Bundler.setup(:default)
require 'geminabox'

Geminabox.data = "geminabox-data"
Geminabox.build_legacy = false

credentials = YAML.load_file('credentials.yml')
use Rack::Auth::Basic do |username, password|
  username == credentials['username'] && password == credentials['password']
end

run Geminabox::Server
