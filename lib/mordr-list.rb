#!/usr/bin/env ruby
#
# ToDo list controller

require 'models/mlist'

module MordrList
  def find_list user_o, title
    user_o.lists.find( :title => title ).first
  end

  def new_list user_o, title, desc
    return nil if find_list( user_o, title )
    list_o = user_o.create( :lists => [ Mlist.new(
                                                  :title     => title,
                                                  :describe  => desc
                                                  )
                            ] )
    list_o.save
  end

  def del_list user_o, title
    list_o = find_list user_o, title
    list_o.destroy unless list_o.nil?
    list_o.save
  end

  def rename_list user_o, title, new_title
    list_o = find_list user_o, title
    list_o.title = new_title unless list_o.nil?
    list_o.save
  end

  def update_description user_o, title, new_desc
    list_o = find_list user_o, title
    list_o.describe = new_desc unless list_o.nil?
    list_o.save
  end

  def toggle_public_off user_o, title
    list_o = find_list user_o, title
    list_o.public = false unless list_o.nil?
    list_o.save
  end

end
