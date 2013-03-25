#!/usr/bin/env ruby
#
# ToDo list controller

require 'stringex'

module MordrList
  def _user_to_object handle
    User.first( :handle => handle )
  end

  def all_lists handle
    user_o = _user_to_object( handle )
    lists = user_o.mlists || nil
    return lists unless lists.nil?
    return []
  end

  def find_list handle, slug
    user_o = _user_to_object handle

    return false if user_o.nil?
    return false if user_o.mlists.length == 0

    user_o.mlists.each do |mlist|
      return mlist if mlist.slug == slug
    end
    return false
  end

  def new_list handle, title, desc
    return nil if find_list( handle, title )

    user_o = _user_to_object handle
    user_o.mlists << Mlist.new(
                               :title     => title,
                               :slug      => title.to_url,
                               :describe  => desc
                               )
    user_o.save
    return title.to_url
  end

  def del_list handle, title
    list_o = find_list handle, title
    list_o.destroy if list_o
  end

  def rename_list handle, title, new_title
    list_o = find_list handle, title
    list_o.title = new_title if list_o
    list_o.save
  end

  def update_description handle, title, new_desc
    list_o = find_list handle, title
    list_o.describe = new_desc if list_o
    list_o.save
  end

  def toggle_public_off handle, title
    list_o = find_list handle, title
    list_o.public = false if list_o
    list_o.save
  end

end
