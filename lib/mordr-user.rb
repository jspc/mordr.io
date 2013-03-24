#!/usr/bin/env ruby
#
# user controller

require 'bcrypt'

module MordrUser
  def find_user handle
    User.find( :handle => handle ).first
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
    user_o.destroy unless user_o.nil?
  end

  def update_email handle, email
    user_o = find_user handle
    user_o.email = email unless user_o.nil?
    user_o.save
  end

  def update_password handle, passowrd
    user_o = find_user handle
    enc_password = BCrypt::Password.create( password, :cost => 5 )
    user_o.password = enc_password unless user.nil?
    user_o.save
  end

  def toggle_paid_on handle
    user_o = find_user handle
    user_o.paid = true unless user.nil?
    user_o.save
  end

  def login? handle, password
    user_o = find_user handle
    if user_o.nil? or BCrypt::Password.new( user_o.password ) != password
      return false
    end
    return true
  end

end
