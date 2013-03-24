#!/usr/bin/env ruby
#
# Simple ToDo list model

class Mlist
  include MongoMapper::EmbeddedDocument

  key :title,    String,  :required => true
  key :describe, String
  key :public,   Boolean, :default => true

  timestamps!

  many :items
end
