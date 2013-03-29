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
    begin
      return user_o.mlists
    rescue
      return []
    end
  end

  def find_list handle, slug
    all_lists(handle).each do |mlist|
      return mlist if mlist.slug == slug
    end
    return false
  end

  def find_list_by_id handle, id
    all_lists(handle).each do |mlist|
      return mlist if mlist._id = id
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

  def del_list handle, slug
    user_o = _user_to_object handle
    user_o.mlists.delete_if{ |mlist| mlist.slug == slug }
    user_o.save
  end

  def rename_list handle, id, new_title
    list_o = find_list_by_id handle, id
    if list_o
      list_o.title = new_title
      list_o.slug = new_title.to_url
    end
    list_o.save
  end

  def update_description handle, id, new_desc
    list_o = find_list_by_id handle, id
    if list_o
      list_o.describe = new_desc
    end
    list_o.save
  end

  def toggle_public handle, id
    list_o = find_list_by_id handle, id
    if list_o
      if list_o.public?
        list_o.public = false
      else
        list_o.public = true
      end
    end
    list_o.save
  end

end
