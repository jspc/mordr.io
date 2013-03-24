#!/usr/bin/env ruby
#
# Application code/ routes

$LOAD_PATH.unshift File.join(File.dirname(__FILE__), '..', 'lib')

require 'sinatra'
require 'haml'
require 'mongo_mapper'
require 'redis'

require 'models/user'
require 'models/list'
require 'models/item'

configure do
  enable :sessions

  redis = Redis.new
  MongoMapper.database = 'mordr'

  set :root,            Proc.new { File.join(File.dirname(__FILE__), '..') }
  set :session_secret,  redis.get( 'mordr.io-key')
end

get '/' do
  puts "Woo!"
end
