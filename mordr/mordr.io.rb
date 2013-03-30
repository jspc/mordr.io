#!/usr/bin/env ruby
#
# Application code/ routes

$LOAD_PATH.unshift File.join(File.dirname(__FILE__), '..', 'lib')
$LOAD_PATH.unshift File.join(File.dirname(__FILE__), '..', 'app')
$LOAD_PATH.unshift File.join(File.dirname(__FILE__), '..', 'app', 'routes')

require 'sinatra'
require 'mongo_mapper'
require 'redis'
require 'digest/md5'

require 'models/user'
require 'models/mlist'
require 'models/item'

class Mordr < Sinatra::Application
  load 'mordr-user.rb'
  load 'mordr-list.rb'
  load 'mordr-item.rb'

  load 'mordr_config.rb'
  load 'mordr_routes.rb'

  include MordrUser
  include MordrList
  include MordrItem
end
