#!/usr/bin/env ruby
#
# Simple ToDo list model

class List
  include MongoMapper::EmbeddedDocument

  key :title,   String,  :required => true
  key :descibe, String
  key :public,  Boolean, :default => true

  timestamps!

  many :items
end
