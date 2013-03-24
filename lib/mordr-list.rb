#!/usr/bin/env ruby
#
# ToDo list controller

require 'stringex'

module MordrList
  def find_list user_o, slug
    list_o = user_o.lists.first( :slug => slug )
    return list_o unless list_o.nil?
    return false
  end

  def new_list user_o, title, desc
    return nil if find_list( user_o, title )
    list_o = user_o.create( :lists => [ Mlist.new(
                                                  :title     => title,
                                                  :slug      => title.to_url,
                                                  :describe  => desc
                                                  )
                            ] )
    list_o.save
  end

  def del_list user_o, title
    list_o = find_list user_o, title
    list_o.destroy if list_o
  end

  def rename_list user_o, title, new_title
    list_o = find_list user_o, title
    list_o.title = new_title if list_o
    list_o.save
  end

  def update_description user_o, title, new_desc
    list_o = find_list user_o, title
    list_o.describe = new_desc if list_o
    list_o.save
  end

  def toggle_public_off user_o, title
    list_o = find_list user_o, title
    list_o.public = false if list_o
    list_o.save
  end

end
