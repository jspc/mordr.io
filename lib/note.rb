#!/usr/bin/env ruby
#
#

require 'active_record'
require 'redis'
require 'redis/objects'
require 'redis/list'

Redis.current = Redis.new(:host => '127.0.0.1', :port => 6379)

class Note < ActiveRecord::Base
  include Redis::Objects
  
  value :task
  value :location
  value :time
  value :length
  list  :attendees

end
