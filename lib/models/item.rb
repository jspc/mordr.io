#!/usr/bin/env ruby
#
# List items

class Item
  include MongoMapper::Document

  key :text, String,  :required => true
  key :desc, String,  :length => { :maximum => 100 }
  key :done, Boolean, :default => false

  timestamps!

end
