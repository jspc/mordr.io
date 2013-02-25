#!/usr/bin/env ruby
#
#

class Note < ActiveRecord::Base
  include Redis::Objects