#!/usr/bin/env ruby
#
# user controller

require 'bcrypt'

module MordrUser
  def find_user handle
    user_o = User.first( :handle => handle )
    return user_o unless user_o.nil?
    return false
  end

  def new_user handle, password, email
    return nil if find_user handle
    user_o = User.new(
                      :handle   =>  handle,
                      :email    =>  email,
                      :password => BCrypt::Password.create( password, :cost => 5 )
                      )
    user_o.save
  end

  def del_user handle
    user_o = find_user handle
    user_o.destroy if user_o
  end

  def update_email handle, email
    user_o = find_user handle
    user_o.email = email if user_o
    user_o.save
  end

  def update_password handle, passowrd
    user_o = find_user handle
    enc_password = BCrypt::Password.create( password, :cost => 5 )
    user_o.password = enc_password if user_o
    user_o.save
  end

  def toggle_paid_on handle
    user_o = find_user handle
    user_o.paid = true if user_o
    user_o.save
  end

  def can_login? handle, password
    user_o = find_user handle
    return false unless user_o
    if BCrypt::Password.new( user_o.password ) == password
      return true
    end
    return false
  end

  def has_paid? handle
    user_o = find_user handle
    return false unless user_o
    return user_o.paid?
  end
  
end
