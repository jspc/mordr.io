#!/usr/bin/env ruby
#
# Basic User model

class User
  include MongoMapper::Document

  key :handle,   String,  :required => true, :unique => true
  key :email,    String,  :format => /@/    # We want a sorta valid email. Who gives a fuck if its fake or dead?
  key :paid,     Boolean, :default => false
  key :password, String,  :require: true, :length => { :minimum => 8 }

  timestamps!

  many :lists

end
